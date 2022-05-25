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
    path('proveedores/<int:id>',views.detalle_proveedor, name = "detail_proveedor"),
    path('proveedores/<int:id>/eliminar',views.eliminar_proveedor, name = "delete_proveedor"),
    path('proveedores/<int:id>/editar',views.update_proveedor, name = "update_proveedor"),
    path('proveedores/reporte_general',views.report_proveedores, name = "report_proveedores"),
    path('proveedores/<int:id>/reporte',views.report_proveedor, name = "report_proveedor"),
    #referencias
    path('proveedores/<int:proveedor_id>/referencias',views.referencias_proveedor,name = 'referencias_proveedor'),
    path('proveedores/<int:proveedor_id>/referencias/crear',views.crear_referencia,name = 'create_referencia'),
    path('proveedores/<int:proveedor_id>/referencias/editar/<int:referencia_id>',views.editar_referencia,name = 'update_referencia'),
    path('proveedores/<int:proveedor_id>/referencias/eliminar/<int:referencia_id>',views.eliminar_referencia,name = 'delete_referencia'),
    #personal
    path('proveedores/<int:proveedor_id>/personal',views.personal_proveedor,name = 'personal_proveedor'),
    path('proveedores/<int:proveedor_id>/personal/crear',views.crear_personal,name = 'create_personal'),
    path('proveedores/<int:proveedor_id>/personal/editar/<int:personal_id>',views.editar_personal,name = 'update_personal'),
    path('proveedores/<int:proveedor_id>/personal/eliminar/<int:personal_id>',views.eliminar_personal,name = 'delete_personal'),
    #personal_clave
    path('proveedores/<int:proveedor_id>/personal_clave',views.personal_clave_proveedor,name = 'personal_clave_proveedor'),
    path('proveedores/<int:proveedor_id>/personal_clave/crear',views.crear_personal_clave,name = 'create_personal_clave'),
    path('proveedores/<int:proveedor_id>/personal_clave/editar/<int:personal_clave_id>',views.editar_personal_clave,name = 'update_personal_clave'),
    path('proveedores/<int:proveedor_id>/personal_clave/eliminar/<int:personal_clave_id>',views.eliminar_personal_clave,name = 'delete_personal_clave'),
]
