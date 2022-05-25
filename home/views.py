from django.shortcuts import render
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user
# Create your views here.

@login_required(login_url='/')
def home(request):
    return render(request, "home.html")

def forbidden(request):
    return render(request, "forbidden.html")