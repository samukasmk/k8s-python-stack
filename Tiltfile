# flask app
docker_build('flask', './apps/flask')
k8s_yaml('./apps/flask/kubernetes.yaml')
k8s_resource('flask', port_forwards=8000)

# django app
docker_build('django', './apps/django')
k8s_yaml('./apps/django/kubernetes.yaml')
k8s_resource('django', port_forwards=8080)

# fastapi app
docker_build('fastapi', './apps/fastapi')
k8s_yaml('./apps/fastapi/kubernetes.yaml')
k8s_resource('fastapi', port_forwards=9000)