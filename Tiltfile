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
    objects=['flask-app-ingress:ingress'],
    links=['http://flask-app.127.0.0.1.nip.io/'],
    labels=['flask-app']
)


#
# FastApi app
#

# docker build
docker_build(
    'fastapi-app-image',
    './apps/fastapi',
    build_args={'fastapi_debug': 'True'},
    live_update=[
        sync('./apps/fastapi', '/app'),
        run('sh -lc "kill -HUP 1"'),
    ]
)

# kubernetes manifests
k8s_yaml('k8s/python-apps/fastapi/manifests/1.deployment.yaml')
k8s_yaml('k8s/python-apps/fastapi/manifests/2.service.yaml')
k8s_yaml('k8s/python-apps/fastapi/manifests/3.ingres.yaml')

# kubernetes ingress
k8s_resource(
    'fastapi-app',
    objects=['fastapi-app-ingress:ingress'],
    links=['http://fastapi-app.127.0.0.1.nip.io/'],
    labels=['fastapi-app']
)


#
# Django app
#

# docker build
docker_build(
    'django-app-image',
    './apps/django',
    build_args={'django_debug': 'True'},
    live_update=[
        sync('./apps/django', '/app'),
        run('sh -lc "kill -HUP 1"'),
    ]
)

# kubernetes manifests
k8s_yaml('k8s/python-apps/django/manifests/1.deployment.yaml')
k8s_yaml('k8s/python-apps/django/manifests/2.service.yaml')
k8s_yaml('k8s/python-apps/django/manifests/3.ingres.yaml')

# kubernetes ingress
k8s_resource(
    'django-app',
    objects=['django-app-ingress:ingress'],
    links=['http://django-app.127.0.0.1.nip.io/'],
    labels=['django-app']
)
