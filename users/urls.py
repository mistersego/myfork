from django.urls import path
from .import views
urlpatterns = [
    path("", views.home_users, name='home_users'),
    path("roles", views.home_roles, name='home_roles')
]


# from django.urls import path
# from . import views
# urlpatterns = [
#     path('areas',views.areas, name = "areas"),
#     path('areas/save',views.guardarArea,name = "guardar-area"),
#     path('areas/cambioestado/<int:id>/',views.cambioEstadoArea, name="area-habilitado"),
#     path('areas/area/<int:id>/',views.obtenerArea, name="area"),
#     path("area/edit", views.editarArea, name="area-editar"),
# ]
