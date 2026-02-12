# -*- mode: Python -*

#
# Docker registry inside k8s cluster
#
default_registry(
    "registry.tools.127.0.0.1.nip.io"
)

#
# Flask app
#

# kubernetes manifests
k8s_yaml('k8s/python-apps/flask/manifests/1.deployment.yaml')
# k8s_yaml('k8s/python-apps/flask/manifests/2.service.yaml')
# k8s_yaml('k8s/python-apps/flask/manifests/3.ingres.yaml')

k8s_resource('example-python', port_forwards=8000)

docker_build(
    'example-python-image',
    './apps/flask',
    # dockerfile="Dockerfile",
    build_args={'flask_debug': 'True'},
    live_update=[
        sync('./apps/flask', '/app'),
])

local_resource(
  "restart-example-python",
  cmd="kubectl rollout restart deploy/example-python",
  deps=["."],  # watch folders to restart the deployment when files change
  auto_init=False
)