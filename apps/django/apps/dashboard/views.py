from django.http import JsonResponse

def healthz(request):
    data = {'app': 'django', 'status': 'success'}
    return JsonResponse(data)
