#!/bin/bash
#

# ask to sudo password in the beginning
sudo echo "Starting at: $(date)"

pushd k8s/cluster/cluster-kind
bash increase-open-files.sh
bash create-cluster.sh kind
popd

pushd k8s/cluster/https-certs
bash create-local-certs-by-mkcert.sh
popd

pushd k8s/cluster/nginx-ingress
bash install-ingress.sh
popd

pushd k8s/dev-tools/docker-registry
bash docker-registry.sh
popd

pushd k8s/infra-services/mongodb
# bash ...
popd

pushd k8s/infra-services/postgres
# bash ...
popd

pushd k8s/infra-services/kafka
# bash ...
popd

pushd k8s/infra-services/websockets
# bash ...
popd

tilt up
