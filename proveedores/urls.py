from django.urls import path
from . import views
urlpatterns = [
    path("rubros-empresas", views.rubrosEmpresas, name="rubros"),
    path("rubros-empresa/save", views.guardarRubro, name="rubros-empresa-guardar"),
    path("rubros-empresa/edit", views.editarRubroEmpresa, name="rubros-empresa-editar"),
    path("rubros-empresa/delete/<int:id>/", views.eliminarRubroEmpresa, name="rubros-empresa-eliminar"),
    path('rubros-empresa/<int:id>/',views.obtenerRubroEmpresa, name="rubro"),
]
