#!/bin/bash


helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace -f ./promop-values.yaml \
  && kubectl -n monitoring apply --recursive -f ./dashboards \
  && kubectl -n monitoring wait --for=condition=Ready pod -l app.kubernetes.io/name=grafana &

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule- \
  && echo "crd waiting" \
  && kubectl -n monitoring wait --for condition=established --timeout=60s crd/servicemonitors.monitoring.coreos.com \
  && echo "crd available" \
  && helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace --version 2.0.6 \
     --set image.tag="2.0.5-kernel5.4a" \
     --set serviceMonitor.enabled="true" \
     --set containerPorts[0].name="metrics" \
     --set containerPorts[0].containerPort="6676" \
     --set containerPorts[0].protocol="TCP" \
  && kubectl apply -f python-app.k8s.yaml \
  && kubectl -n init wait --for=condition=complete job/initial-curls &

wait < <(jobs -p)
touch /tmp/finished