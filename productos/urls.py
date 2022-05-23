from django.urls import path
from . import views
urlpatterns = [
    path("productos", views.productos, name="productos"),
    path("productos/save", views.guardar_producto,name="guardar_producto" ),
    path('productos/data/<int:id>/',views.actualizar_producto_datos, name = "actualizar_producto_datos"),
    path('productos/update',views.actualizar_producto, name = "actualizar_producto"),
    path('productos/delete/<int:id>/',views.eliminar_producto, name = "eliminar_producto"),
    path("categorias", views.categoriasProductos, name="categorias"),
    path("categorias/save", views.guardarCategoria, name="categorias-guardar"),
    path('categorias/cambioestado/<int:id>/',views.cambioEstadoCategoriaProducto, name="categoria-habilitado"),
    path('categorias/categoria/<int:id>/',views.obtenercategoriaProducto, name="categoria"),
    path("categorias/edit", views.editarCategoria, name="categorias-editar"),
    path("categorias/delete/<int:id>/", views.eliminarCategoria, name="categorias-eliminar"),
    #marca
    path('marcas',views.marcas, name = "marcas"),
    path('marcas/save',views.guardar_marca,name = "guardar_marca"),
    path('marcas/delete/<int:id>/',views.eliminar_marca, name = "eliminar_marca"),
    path('marcas/data/<int:id>/',views.actualizar_marca_datos, name = "actualizar_marca_datos"),
    path('marcas/update',views.actualizar_marca, name = "actualizar_marca"),
]
