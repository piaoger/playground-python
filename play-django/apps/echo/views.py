from django.http import HttpResponse
from .models import Person
import json

# Create your views here.

def hello(request):
    return HttpResponse('echo.')


def user(request):
    username = request.GET['name']
    resp = {}

    person = None
    try:
        person = Person.objects.get(name=username)
    except Exception,e:
        person = None

    if person:
        data = {
            'name': person.age,
            'age': person.age
        }
        resp = {
            'errcode' : -1,
            'data': data,
        }
    else:
        data = {
            'msg': 'user not found',
        }
        resp = {
            'errcode' : 0,
            'data': data,
        }

    return HttpResponse(json.dumps(resp), content_type = 'application/json')
