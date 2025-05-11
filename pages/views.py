from django.shortcuts import render

from django.http import HttpRequest, HttpResponse

def hello_world(request: HttpRequest) -> HttpResponse:
    return render(request, "hello_world_page.html")