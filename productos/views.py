from django.shortcuts import render
from .models import CategoriaProducto
# Create your views here.

def productos(request):
    return render(request,'productos/productos.html')

def categoriasProductos(request):
    categorias=CategoriaProducto.objects.all()
    context ={'categorias':categorias}
    return render(request, 'categorias/categorias.html', context)
