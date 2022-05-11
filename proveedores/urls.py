from django.urls import path
from . import views
urlpatterns = [
    path("rubros-empresas", views.rubrosEmpresas, name="rubros"),
    path("rubros-empresa/save", views.guardarRubro, name="rubros-empresa-guardar"),
    path("rubros-empresa/edit", views.editarRubroEmpresa, name="rubros-empresa-editar"),
    path("rubros-empresa/delete/<int:id>/", views.eliminarRubroEmpresa, name="rubros-empresa-eliminar"),
    path('rubros-empresa/<int:id>/',views.obtenerRubroEmpresa, name="rubro"),
    #proveedores
    path('proveedores',views.proveedores, name = "proveedores"),
    path('proveedores/crear',views.create_proveedor, name = "create_proveedor"),
    
    path('proveedores/delete/<int:id>/',views.eliminar_proveedor, name = "eliminar_proveedor"),
    path('proveedores/editar/<int:id>/',views.update_proveedor, name = "update_proveedor"),    

]
