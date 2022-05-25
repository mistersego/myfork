from django.http import HttpResponse
from django.shortcuts import redirect
import logging
def unauthenticated_user(view_func):	
	def wrapper_func(request, *args, **kwargs):
		if request.user.is_authenticated:
			return redirect('home')
		else:
			return view_func(request, *args, **kwargs)

	return wrapper_func

def allowed_users(allowed_roles=[]):
	logging.debug('request.user.groups.exists()')
	def decorator(view_func):
		def wrapper_func(request, *args, **kwargs):

			group = None
			if request.user.groups.exists():				
				group = request.user.groups.all()[0].name

			if group in allowed_roles:
				return view_func(request, *args, **kwargs)
			else:
				# return HttpResponse('You are not authorized to view this page')
					return redirect('forbidden')
		return wrapper_func
	return decorator

def admin_only(view_func):
	def wrapper_function(request, *args, **kwargs):
		group = None
		if request.user.groups.exists():
			group = request.user.groups.all()[0].name

		if group != 'admin':
			return redirect('forbidden')

		if group == 'admin':
			return view_func(request, *args, **kwargs)

	return wrapper_function