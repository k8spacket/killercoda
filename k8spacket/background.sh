#!/bin/bash

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace --set image.tag="kernel5.4a" --version 2.0.2

helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace -f ./promop-values.yaml

kubectl -n monitoring apply --recursive -f ./dashboards

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule

kubectl -n monitoring wait --for=condition=Ready pod -l app.kubernetes.io/name=grafana

kubectl apply -f python-app.k8s.yaml

kubectl -n init wait --for=condition=complete job/initial-curls

touch /tmp/finished