from django.shortcuts import render
from .models import CategoriaProducto
from .models import Producto
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse

# Create your views here.

def productos(request):
    productos=Producto.objects.all()
    context ={'productos':productos}
    return render(request,'productos/productos.html', context)



/ .-
1
#----------------------CATEGORIAS--------------------------------

def categoriasProductos(request):
    categorias=CategoriaProducto.objects.all()
    context ={'categorias':categorias}
    return render(request, 'categorias/categorias.html', context)

def cambioEstadoCategoriaProducto(request,  id):
    categoria=CategoriaProducto.objects.get(pk=id)
    if categoria.habilitada==1:
        categoria.habilitada=0
        categoria.save()
    else:
        categoria.habilitada=1
        categoria.save()

    messages.success(request, 'El cambio de estado de la categoria se ha realizado correctamente', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def obtenercategoriaProducto(request,  id):
    categoria=CategoriaProducto.objects.get(pk=id)
    context ={'categoria':categoria}
    return render(request, 'categorias/categoria-editar.html', context)

def eliminarCategoria(request, id):
    categoria = CategoriaProducto.objects.get(id=id)
    categoria.delete()
    messages.success(request, 'categoria de producto eliminada correctamente', extra_tags='danger')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def editarCategoria(request):
      #variables de request
    codigoGet =request.GET["codigo"]
    nombreGet =request.GET["nombre"]
    idGet=request.GET["id"]
    #variables de request
    categorias=CategoriaProducto.objects.filter(codigo=codigoGet).exclude(id=idGet)
    categoria=CategoriaProducto.objects.get(pk=idGet)
    if categorias:
        messages.error(request, 'No se ha podido actualizar la categoria porque el codigo ya existe.', extra_tags='warning')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        categoria.nombre=nombreGet
        categoria.codigo=codigoGet
        categoria.save()
        messages.success(request, 'categoria de producto actualizada correctamente', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def guardarCategoria( request):
    #variables de request
    codigoGet =request.GET["codigo"]
    nombreGet =request.GET["nombre"]
    #variables de request

    categorias=CategoriaProducto.objects.filter(codigo=codigoGet)
    if categorias:
        #return HttpResponse("codigo duplicado")
        messages.error(request, 'No se ha podido guardar la categoria porque el codigo ya existe.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        categoria = CategoriaProducto(nombre=nombreGet,
                                      codigo=codigoGet,
                                      habilitada=True)
        categoria.save()
        messages.success(request, 'categoria de producto agregada correctamente', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

#----------------------CATEGORIAS--------------------------------