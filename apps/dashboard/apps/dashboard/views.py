from django.http import JsonResponse

def home_view(request):
    data = {'app': 'dashboard', 'status': 'success'}
    return JsonResponse(data)
