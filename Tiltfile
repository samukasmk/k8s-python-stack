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

# load tilt file (in starklak language) https://github.com/bazelbuild/starlark
load('companies/example_co/django/infra/tilt/Tiltfile', 'example_co_django')
load('companies/example_co/fastapi/infra/tilt/Tiltfile', 'example_co_fastapi')
load('companies/example_co/flask/infra/tilt/Tiltfile', 'example_co_flask')

# define tilt resources
example_co_django()
example_co_fastapi()
example_co_flask()
