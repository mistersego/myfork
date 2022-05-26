from django.urls import path
from . import views
urlpatterns = [
    path('requisiciones',views.requisiciones, name = "requisiciones"),
    path('requisiciones/crear',views.requisicionCrear, name = "requisicion-crear"),
    path('requisiciones/guardar/paso1',views.guardarRequisicion1, name = "requisicion-guardar-paso1"),
    path('requisiciones/crear2/<int:id>/',views.requisicionCrear2, name = "requisicion-crear2"),
    path('requisiciones/guardar/detalle/producto',views.guardarDetalleRequisicion, name = "requisicion-guardar-detalle"),
    path('requisiciones/eliminar/detalle/<int:id>/',views.eliminarDetalleRequisicion, name = "requisicion-eliminar-detalle"),
    path('requisiciones/pendientes',views.requisicionesPorAprobar, name = "requisiciones-por-aprobar"),
    path('requisiciones/cancelar/<int:id>/',views.cancelarRequisicion, name = "requisiciones-cancelar"),
    path('requisiciones/evaluar/<int:id>/',views.evaluarRequisicion, name = "requisicion-evaluar"),
    path('requisiciones/evaluar/final/<int:id>/<int:estado>',views.cambioDeEstadoRequisicion, name = "requisicion-evaluar-final"),
    path('requisiciones/editar/<int:id>/',views.requisicionEditar, name = "requisicion-editar"),
    path('requisiciones/finalizadas',views.requisicionesFinalizadasPorUnJefe, name = "requisiciones-finalizadas-por-jefe"),
    path('requisiciones/requisicion/ver/<int:id>/',views.requisicionVer, name = "requisicion-ver"),
    
    #path('areas/save',views.guardarArea,name = "guardar-area"),
    # path('areas/cambioestado/<int:id>/',views.cambioEstadoArea, name="area-habilitado"),
    # path('areas/area/<int:id>/',views.obtenerArea, name="area"),
    # path("area/edit", views.editarArea, name="area-editar"),
]
