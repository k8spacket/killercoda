#!/bin/bash


helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace -f ./promop-values.yaml \
  && kubectl -n monitoring apply --recursive -f ./dashboards \
  && kubectl -n monitoring wait --for=condition=Ready pod -l app.kubernetes.io/name=grafana &

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule- \
  && helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace --set image.tag="2.0.5-kernel5.4a" --version 2.0.5 \
  && kubectl apply -f python-app.k8s.yaml \
  && kubectl -n init wait --for=condition=complete job/initial-curls &

wait < <(jobs -p)
touch /tmp/finished