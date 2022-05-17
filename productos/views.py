
import fileinput
from stat import FILE_ATTRIBUTE_ARCHIVE
from django.views import View
from pkg_resources import require
from .models import CategoriaProducto
from .models import Producto
from .models import Marca
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, redirect, render

# Create your views here.

def productos(request):
    productos=Producto.objects.all()
    marcas=Marca.objects.all()
    context ={'productos':productos, 'marcas':marcas}
    return render(request,'productos/productos.html', context)

    

def actualizar_producto(request):
    producto = get_object_or_404(Producto, id=request.POST['id'])
    productos = Producto.objects.filter(producto = request.POST['producto']).exclude(id = request.POST['id']).count()

    if productos > 0:
        messages.success(request, 'Ya existe una marca con el nombre ingresado.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        producto.marca_id = request.POST['marca_id']
        producto.descripcion = request.POST['descripcion']
        producto.nombre= request.POST['nombre']
        producto.color= request.POST['color']
        producto.garantia=request.POST['garantia']
        producto.utilidad=request.POST['utilidad']
        producto.caracteristica=request.POST['caracteristica']
        producto.precio=request.POST['precio']
        producto.url_imagen_producto=request.POST['url_imagen_producto']
        producto.save()
        
        messages.success(request, 'Marca actualizada correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def actualizar_producto_datos(request,id):
    producto = get_object_or_404(Producto, id=id)
    json_response = JsonResponse({'id':producto.id,'nombre':producto.nombre,'descripcion':producto.descripcion,'caracteristica':producto.caracteristica,
    'precio':producto.precio,'garantia':producto.garantia,'color':producto.color, 'utilidad':producto.utilidad,
    'url_imagen_producto':producto.url_imagen_producto, 'marca_id':producto.marca_id})
    return json_response

def guardar_producto(request):
    id_marca = request.POST['marca_id']
    precio_producto = request.POST['precio']
    caracteristica_producto= request.POST['caracteristica']
    color_producto = request.POST['color']
    utilidad_producto=request.POST['utilidad']
    descripcion_producto = request.POST['descripcion']
    garantia_producto = request.POST['garantia']
    #url_imagen_producto = request.POST['fileinput']
    url_imagen_producto = request.FILES['imagen']
    nombre_producto = request.POST['nombre']

    #producto = Producto.objects.filter(producto = nombre_producto)
    #producto_marca = Producto.objects.filter(producto_marca = id_marca)
    producto_nuevo = Producto(marca_id =  id_marca, precio = precio_producto, caracteristica = caracteristica_producto,
                                color= color_producto, utilidad = utilidad_producto,descripcion= descripcion_producto, garantia= garantia_producto,
                                url_imagen_producto= url_imagen_producto, nombre= nombre_producto )
    producto_nuevo.save()
    messages.success(request,'Producto agregado.', extra_tags='success')
    return redirect('productos') #HttpResponse(request.META.get('HTTP_REFERER'))

    
    
   
        


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