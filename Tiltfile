# -*- mode: Tiltfile -*

#
# Docker registry inside k8s cluster
#
default_registry(
    "registry.tools.127.0.0.1.nip.io"
)


#
# Company: Example Co.
#
load('./companies/example_co/django/infra/tilt/Tiltfile', 'example_co_django')
load('./companies/example_co/flask/infra/tilt/Tiltfile', 'example_co_flask')
load('./companies/example_co/fastapi/infra/tilt/Tiltfile', 'example_co_fastapi')



