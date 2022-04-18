from django.shortcuts import render
from .models import CategoriaProducto
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages

# Create your views here.

def productos(request):
    return render(request,'productos/productos.html')

def categoriasProductos(request):
    categorias=CategoriaProducto.objects.all()
    context ={'categorias':categorias}
    return render(request, 'categorias/categorias.html', context)

def guardarCategoria( request):
    #variables de request
    codigoGet =request.GET["codigo"]
    nombreGet =request.GET["nombre"]
    #variables de request

    categorias=CategoriaProducto.objects.filter(Codigo=codigoGet)
    if categorias:
        #return HttpResponse("codigo duplicado")
        messages.error(request, 'No se ha podido guardar la categoria porque el codigo ya existe.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        categoria = CategoriaProducto(Nombre=nombreGet,
                                      Codigo=codigoGet,
                                      Habilitada=True)
        categoria.save()
        messages.success(request, 'categoria de producto agregada correctamente', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
