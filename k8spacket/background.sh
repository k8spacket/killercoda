#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace --set image.tag="kernel5.4a"

helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace -f ./promop-values.yaml

kubectl -n monitoring apply --recursive -f ./dashboards

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule

kubectl create namespace example
kubectl -n example apply -f python-app.k8s.yaml

touch /tmp/finished