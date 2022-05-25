from pkg_resources import require
from .models import Requisicion
from .models import NivelRequisicion
from .models import EstadoRequisicion
from .models import RequisicionProducto
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from productos.models import Producto

def requisiciones(request):
    query = 'select rr.id, rr.nivel_id, rr.jefe_id, rr.fecha_requisicion , rr.fecha_estimada , rr.usuario_id , rr.estado_id , rn.nivel, re.estado    from req_requisicion rr inner join req_nivel rn on rr.nivel_id  = rn.id inner join req_estado re  on rr.estado_id  = re.id' 
    obj=Requisicion.objects.raw(query)#modificar a razon que aparezcan las requisiciones que yo he realziado como uusaurio
    context ={'requisiciones':obj}
    return render(request, 'requisiciones/requisiciones.html', context)

def requisicionesPorAprobar(request):
    query = 'select rr.id, rr.nivel_id, rr.jefe_id, rr.fecha_requisicion , rr.fecha_estimada , rr.usuario_id , rr.estado_id , rn.nivel, re.estado    from req_requisicion rr inner join req_nivel rn on rr.nivel_id  = rn.id inner join req_estado re  on rr.estado_id  = re.id where re.id=3 or re.id=4' 
    obj=Requisicion.objects.raw(query) #modificar a razon que aparezcan las requisiciones que se aprueban por un jefe.
    context ={'requisiciones':obj}
    return render(request, 'requisiciones/requisiciones-por-aprobar.html', context)


def requisicionCrear(request):
    niveles=NivelRequisicion.objects.all()
    jefes = User.objects.all(); #SE DEBE CAMBIAR LA CONSULTA LUEGO
    context ={'niveles':niveles, 'jefes': jefes}
    return render(request, 'requisiciones/requisiciones-agregar-1.html', context)


def guardarRequisicion1( request): #requisicion parte 1
    #variables de request
    fechaReq =request.GET["fecha_req"]
    fechaEs =request.GET["fecha_es"]
    nivel =request.GET["nivel"]
    jefe =request.GET["jefe"]
    #variables de request

    req = Requisicion(nivel_id=nivel,
                jefe_id=jefe,
                fecha_requisicion=fechaReq,
                fecha_estimada=fechaEs,
                usuario_id=1,
                estado_id=4) #se debe cambiar ya que ahorita requerida es = 4 significa que se debe validar la requisicion
    req.save()

    return HttpResponseRedirect('/requisiciones/crear2/'+str(req.id))


def requisicionCrear2(request, id ):
    req=Requisicion.objects.get(pk=id)
    estado=EstadoRequisicion.objects.get(pk=req.estado_id)
    nivel=NivelRequisicion.objects.get(pk=req.nivel_id)
    productos = Producto.objects.all()
    jefe=User.objects.get(pk=req.jefe_id)

    sql = "SELECT rrp.cantidad ,rrp.id, rrp.producto_id , rrp.requisicion_id , pp.nombre FROM req_requisicion_producto rrp  INNER JOIN pro_producto pp ON rrp.producto_id  = pp.id where rrp.requisicion_id ="+str(id)+";";
    detalles= RequisicionProducto.objects.raw(sql);
    context ={'req': req, 'estado': estado,'nivel':nivel,'jefe': jefe, 'productos': productos,'id': id, "detalles": detalles}
    return render(request, 'requisiciones/requisiciones-agregar-2.html', context)


def guardarDetalleRequisicion( request): 
    #variables de request
    producto =request.GET["producto"]
    cantidad =request.GET["cantidad"]
    id =request.GET["id"]
    #variables de request

    req = RequisicionProducto(producto_id=producto,
                cantidad=cantidad,
                requisicion_id=id)
    req.save()
    messages.success(request, 'Se ha agregado el detalle correctamente', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def eliminarDetalleRequisicion(request, id):    
    detalle = RequisicionProducto.objects.get(id = id)
    detalle.delete()
    messages.success(request, 'Detalle eliminado correctamente.', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def cancelarRequisicion(request, id):
    req = get_object_or_404(Requisicion, id=id)
    if(req.estado_id==4   or req.estado_id==3):
      req.estado_id = 5
      req.save()
      messages.success(request, 'Requisición ha sido cancelada  correctamente.', extra_tags='success')
    else:
      messages.success(request, 'No se puede cambiar el estado a cancelada porque la requisición ha entrado en un proceso que no puede ser modificado.', extra_tags='danger')
  
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))



def evaluarRequisicion(request, id ):
    req=Requisicion.objects.get(pk=id)
    estado=EstadoRequisicion.objects.get(pk=req.estado_id)
    nivel=NivelRequisicion.objects.get(pk=req.nivel_id)
    productos = Producto.objects.all()
    jefe=User.objects.get(pk=req.jefe_id)

    sql = "SELECT rrp.cantidad ,rrp.id, rrp.producto_id , rrp.requisicion_id , pp.nombre ,  pp2.proveedor  FROM req_requisicion_producto rrp  INNER JOIN pro_producto pp ON rrp.producto_id  = pp.id INNER JOIN prove_proveedor pp2 ON pp.proveedor_id  = pp2.id where rrp.requisicion_id ="+str(id)+";";
    detalles= RequisicionProducto.objects.raw(sql);
    context ={'req': req, 'estado': estado,'nivel':nivel,'jefe': jefe, 'productos': productos,'id': id, "detalles": detalles}
    return render(request, 'requisiciones/requisicion-aprobar.html', context)



def cambioDeEstadoRequisicion(request, id):
    req = get_object_or_404(Requisicion, id=id)
    req.estado_id = request.GET["estado"]
    req.save()

    obs = request.GET["observacion"]
  
       
    messages.success(request, 'Requisición ha sido cancelada  correctamente.', extra_tags='success')
    return HttpResponseRedirect('/requisiciones/pendientes/')
