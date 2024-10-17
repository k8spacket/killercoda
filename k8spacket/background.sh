#!/bin/bash


helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "Installing Monitoring stack ..." \
  && helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace -f ./promop-values.yaml \
  && kubectl -n monitoring apply --recursive -f ./dashboards \
  && kubectl -n monitoring wait --for=condition=Ready pod -l app.kubernetes.io/name=grafana --timeout=300s \
  && echo "Monitoring stack ready" &

echo "Installing k8spacket ..." \
  && while ! kubectl -n monitoring get crd/servicemonitors.monitoring.coreos.com ;do echo "waiting for crd/servicemonitors.monitoring.coreos.com"; sleep 1; done \
  && kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule- \
  && helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace \
     --set serviceMonitor.enabled="true" \
     --set containerPorts[0].name="metrics" \
     --set containerPorts[0].containerPort="6676" \
     --set containerPorts[0].protocol="TCP" \
  && kubectl -n k8spacket rollout status daemonset k8spacket \
  && kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule \
  && kubectl apply -f python-app.k8s.yaml \
  && kubectl -n init wait --for=condition=complete job/initial-curls --timeout=300s \
  && echo "k8spacket ready" &

wait < <(jobs -p)
touch /tmp/finished