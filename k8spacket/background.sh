#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace
helm upgrade --install -n monitoring promop prometheus-community/kube-prometheus-stack --set grafana.adminPassword=admin -f ./promop-values.yaml

kubectl -n monitoring apply --recursive -f ./dashboards

kubectl port-forward --address 0.0.0.0 service/k8spacket 8080:8080

touch /tmp/finished