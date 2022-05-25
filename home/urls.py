from django.urls import path
from django.contrib.auth import views as auth_views
from django.contrib.auth.views import LogoutView

from . import views
urlpatterns = [
    path("inicio", views.home, name='home'),
   
    path("", auth_views.LoginView.as_view(template_name="login.html"), name='login'),
    path("logout/", LogoutView.as_view(next_page='/'), name='logout'),
    path("forbidden", views.forbidden, name='forbidden'),
]
