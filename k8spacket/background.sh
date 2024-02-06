#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo update

helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace

touch /tmp/finished