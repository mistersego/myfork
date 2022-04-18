from django.urls import path
from . import views
urlpatterns = [
    path("productos", views.productos, name="productos"),
    path("categorias", views.categoriasProductos, name="categorias"),
    path("categorias/save", views.guardarCategoria, name="categorias-guardar")
]
