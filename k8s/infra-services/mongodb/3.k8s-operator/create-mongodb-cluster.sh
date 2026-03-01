#!/bin/bash
#

set -euo pipefail

echo "===== Namespace ====="
kubectl apply -f k8s/infra-services/mongodb/3.k8s-operator/manifests/1.namespace.yaml

echo "===== Instalando MongoDB Community Kubernetes Operator (MCK): 1.7.0 ====="
kubectl apply -n mongodb -k github.com/mongodb/mongodb-kubernetes/config/default?ref=1.7.0

echo "===== Aguardando operator ficar disponivel ====="
kubectl -n mongodb rollout status deploy/mongodb-kubernetes-operator --timeout=300s

echo "===== Secret de credenciais ====="
kubectl apply -f k8s/infra-services/mongodb/3.k8s-operator/manifests/2.secret.yaml

echo "===== MongoDBCommunity cluster ====="
kubectl apply -f k8s/infra-services/mongodb/3.k8s-operator/manifests/3.cluster.yaml

echo "===== Aguardando recurso MongoDBCommunity entrar em Running ====="
for i in $(seq 1 40); do
  phase="$(kubectl -n mongodb get mongodbcommunity mongodb-cluster -o jsonpath='{.status.phase}' 2>/dev/null || true)"

  if [ "${phase}" = "Running" ]; then
    echo "===== Cluster mongodb-cluster esta Running ====="
    break
  fi

  if [ "${i}" -eq 40 ]; then
    echo "Erro: timeout aguardando mongodb-cluster ficar Running (fase atual: ${phase:-desconhecida})"
    kubectl -n mongodb get mongodbcommunity mongodb-cluster -o yaml || true
    exit 1
  fi

  echo "   - tentativa ${i}/40 (fase atual: ${phase:-pendente}), aguardando 15s..."
  sleep 15
done

echo "===== Recursos no namespace mongodb ====="
kubectl -n mongodb get mongodbcommunity,pods,svc,secrets
