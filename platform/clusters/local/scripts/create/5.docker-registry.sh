#!/bin/bash
#

set -euo pipefail

echo ">> Namespace"
kubectl apply -f platform/clusters/local/k8s/registry/1-namespace.yml

echo ">> PVC"
kubectl apply -f platform/clusters/local/k8s/registry/2-pvc.yml

echo ">> Deployment"
kubectl apply -f platform/clusters/local/k8s/registry/3-deployment.yml

echo ">> Service"
kubectl apply -f platform/clusters/local/k8s/registry/4-service.yml

echo ">> Ingress"
kubectl apply -f platform/clusters/local/k8s/registry/5-ingress.yml

echo ">> Aguardando ficar pronto..."
kubectl -n tools rollout status deploy/docker-registry
kubectl -n tools get all,ingress
