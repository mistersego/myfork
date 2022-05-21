from django.urls import path
from . import views
urlpatterns = [
    path('requisiciones',views.requisiciones, name = "requisiciones"),
    path('requisiciones/crear',views.requisicionCrear, name = "requisicion-crear"),
     path('requisiciones/guardar/paso1',views.guardarRequisicion1, name = "requisicion-guardar-paso1"),
      path('requisiciones/crear2/<int:id>/',views.requisicionCrear2, name = "requisicion-crear2"),
    #path('areas/save',views.guardarArea,name = "guardar-area"),
    # path('areas/cambioestado/<int:id>/',views.cambioEstadoArea, name="area-habilitado"),
    # path('areas/area/<int:id>/',views.obtenerArea, name="area"),
    # path("area/edit", views.editarArea, name="area-editar"),
]
