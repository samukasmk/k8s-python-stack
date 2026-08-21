#!/bin/bash
#
CERTS_FOLDER="platform/clusters/local/k8s/https/certs"
TLS_CERT="$CERTS_FOLDER/tls.crt"
TLS_KEY="$CERTS_FOLDER/tls.key"

echo
echo
echo "=========================================================================="
echo "# Checking certificates"
echo "=========================================================================="

if [[ -f "$TLS_CERT" && -f "$TLS_KEY" ]]; then
    echo "Local cert files already exists."
    echo "Skipping..."
    exit 0
fi

echo
echo
echo "=========================================================================="
echo "# mkdir -p $CERTS_FOLDER"
echo "=========================================================================="
mkdir -p $CERTS_FOLDER

echo
echo
echo "=========================================================================="
echo "# mkcert -cert-file $TLS_CERT \\"
echo "    -key-file $TLS_KEY \\"
echo "    '127.0.0.1' '1::' 'localhost' \\"
echo "    '*.localhost' '*.local' \\"
echo "    '127-0-0-1.nip.io' '127.0.0.1.nip.io' \\"
echo "    '*.127-0-0-1.nip.io' '*.127.0.0.1.nip.io' \\"
echo "    '*.apps.127-0-0-1.nip.io' '*.apps.127.0.0.1.nip.io' \\"
echo "    '127-0-0-1.sslip.io' '127.0.0.1.sslip.io' \\"
echo "    '*.127-0-0-1.sslip.io' '*.127.0.0.1.sslip.io' \\"
echo "    '*.apps.127-0-0-1.sslip.io' '*.apps.127.0.0.1.sslip.io'"
echo "=========================================================================="

mkcert -cert-file $TLS_CERT \
    -key-file $TLS_KEY \
    '127.0.0.1' '1::' 'localhost' \
    '*.localhost' '*.local' '*.docker.internal' \
    '127-0-0-1.nip.io' '127.0.0.1.nip.io' \
    '*.127-0-0-1.nip.io' '*.127.0.0.1.nip.io' \
    '*.apps.127-0-0-1.nip.io' '*.apps.127.0.0.1.nip.io' \
    '127-0-0-1.sslip.io' '127.0.0.1.sslip.io' \
    '*.127-0-0-1.sslip.io' '*.127.0.0.1.sslip.io' \
    '*.apps.127-0-0-1.sslip.io' '*.apps.127.0.0.1.sslip.io'

echo
echo
echo "=========================================================================="
echo "# mkcert -install -cert-file $TLS_CERT \\"
echo "    -key-file $TLS_KEY"
echo "=========================================================================="

mkcert -install -cert-file $TLS_CERT \
    -key-file $TLS_KEY \

echo
echo
echo "=========================================================================="
echo "kubectl create secret tls https-certs \\"
echo "  --cert=$TLS_CERT \\"
echo "  --key=$TLS_KEY \\"
echo "  --dry-run=client -o yaml | kubectl apply -f -"
echo "=========================================================================="

kubectl create secret tls https-certs \
  --cert=$TLS_CERT \
  --key=$TLS_KEY \
  --dry-run=client -o yaml | kubectl apply -f -

echo
echo
echo "=========================================================================="
echo '# kubectl get secrets https-certs'
echo "=========================================================================="

kubectl get secrets https-certs