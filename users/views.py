from django.shortcuts import render
from django.contrib.auth.models import User, Group
from home.decorators import unauthenticated_user, allowed_users, admin_only
from django.contrib.auth.decorators import login_required
# Create your views here.

login_required(login_url='/')
@allowed_users(allowed_roles=['admin'])
# @admin_only
def home_users(request):
    usuarios = User.objects.all()
    context = { 'listado': usuarios }
    return render(request, 'users/listado.html', context)

login_required(login_url='/')
@allowed_users(allowed_roles=['admin'])
def home_roles(request):
    roles = Group.objects.all()
    context = { 'listado': roles }
    return render(request, 'users/roles.html', context)