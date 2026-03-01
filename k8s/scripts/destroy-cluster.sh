#!/bin/bash
#

echo "Destroing at: $(date)"

echo
echo
echo '=========================================================================='
echo "# kind delete cluster --name tilt"
echo '=========================================================================='
echo 
kind delete cluster --name tilt
