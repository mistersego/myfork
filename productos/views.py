
from .models import CategoriaProducto
from .models import Producto
from .models import Marca
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render

# Create your views here.

def productos(request):
    productos=Producto.objects.all()
    context ={'productos':productos}
    return render(request,'productos/productos.html', context)





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


#------------------------MARCAS--------------------------------
def marcas(request):
    #marcas=Marca.objects.all()
    marcas=Marca.objects.raw('SELECT m.id , m.marca, m.descripcion, COUNT(p.marca_id) as conteo FROM pro_marca AS m LEFT JOIN pro_producto p ON m.id = p.marca_id GROUP BY m.marca;')
    context ={'marcas':marcas}
    return render(request,'marcas/marcas.html', context)

def guardar_marca(request):
    nombre_marca = request.POST['marca']
    descripcion = request.POST['descripcion']

    marca = Marca.objects.filter(marca = nombre_marca)
    if marca:
        messages.error(request, 'Ya existe una marca con el nombre ingresado.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        marca_nueva = Marca(marca = nombre_marca, descripcion = descripcion)
        marca_nueva.save()
        messages.success(request, 'Marca agregada correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def eliminar_marca(request, id):    
    marca_productos = Producto.objects.filter(marca_id = id).count()
    
    if marca_productos > 0 :
        messages.error(request, 'No puede eliminar la marca porque cuenta con '  +  str(marca_productos) + ' productos asignados.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        marca = Marca.objects.get(id = id)
        marca.delete()
        messages.success(request, 'Marca eliminada correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    

def actualizar_marca(request):
    marca = get_object_or_404(Marca, id=request.POST['id'])
    marcas = Marca.objects.filter(marca = request.POST['marca']).exclude(id = request.POST['id']).count()

    if marcas > 0:
        messages.success(request, 'Ya existe una marca con el nombre ingresado.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        marca.marca = request.POST['marca']
        marca.descripcion = request.POST['descripcion']
        marca.save()
        
        messages.success(request, 'Marca actualizada correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def actualizar_marca_datos(request,id):
    marca = get_object_or_404(Marca, id=id)
    json_response = JsonResponse({'id':marca.id,'marca':marca.marca,'descripcion':marca.descripcion})
    return json_response
    
#------------------------MARCAS--------------------------------