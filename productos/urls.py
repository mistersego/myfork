from django.urls import path
from . import views
urlpatterns = [
    path("productos", views.productos, name="productos"),
    path("categorias", views.categoriasProductos, name="categorias"),
    path("categorias/save", views.guardarCategoria, name="categorias-guardar"),
    path('categorias/cambioestado/<int:id>/',views.cambioEstadoCategoriaProducto, name="categoria-habilitado"),
    path('categorias/categoria/<int:id>/',views.obtenercategoriaProducto, name="categoria")
]
