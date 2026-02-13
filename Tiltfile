# -*- mode: Tiltfile -*

#
# Docker registry inside k8s cluster
#
default_registry(
    "registry.tools.127.0.0.1.nip.io"
)

#
# Flask app
#

# docker build
docker_build(
    'flask-app-image',
    './apps/flask',
    build_args={'flask_debug': 'True'},
    live_update=[
        sync('./apps/flask', '/app'),
        run('sh -lc "kill -HUP 1"'),
    ]
)

# kubernetes manifests
k8s_yaml('k8s/python-apps/flask/manifests/1.deployment.yaml')
k8s_yaml('k8s/python-apps/flask/manifests/2.service.yaml')
k8s_yaml('k8s/python-apps/flask/manifests/3.ingres.yaml')

# kubernetes ingress
k8s_resource(
    'flask-app',
    objects=['web:ingress'],
    links=['http://flask-app.127.0.0.1.nip.io/'],
    labels=['flask-app']
)

## restart every chankl
# local_resource(
#    "live-update",
#    cmd="kubectl rollout restart deploy/flask-app",
#    deps=["./apps/flask"],         # watch folders to restart the deployment when files change
#    resource_deps=["flask-app"],   # só roda depois do flask-app existir
#    auto_init=False,               # não roda no primeiro tilt up
#    labels=['flask-app']
# )
