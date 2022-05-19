from django.urls import path
from . import views
urlpatterns = [
    path('requisiciones',views.requisiciones, name = "requisiciones"),
    path('requisiciones/crear',views.requisicionCrear, name = "requisicion-crear"),
    #path('areas/save',views.guardarArea,name = "guardar-area"),
    # path('areas/cambioestado/<int:id>/',views.cambioEstadoArea, name="area-habilitado"),
    # path('areas/area/<int:id>/',views.obtenerArea, name="area"),
    # path("area/edit", views.editarArea, name="area-editar"),
]
