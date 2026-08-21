#!/bin/bash
#
SCRIPTS_FOLDER="platform/clusters/local/scripts/create/"

# ask to sudo password in the beginning
sudo echo "Starting at: $(date)"

bash $SCRIPTS_FOLDER/1.increase-open-files.sh
bash $SCRIPTS_FOLDER/2.create-cluster.sh tilt
bash $SCRIPTS_FOLDER/3.create-local-certs-by-mkcert.sh
bash $SCRIPTS_FOLDER/4.install-ingress.sh
bash $SCRIPTS_FOLDER/5.docker-registry.sh

echo
echo
echo '=========================================================================='
echo "# Run: tilt up"
echo '=========================================================================='
echo 
echo finished at: $(date)
