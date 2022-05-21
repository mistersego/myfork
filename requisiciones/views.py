from pkg_resources import require
from .models import Requisicion
from .models import NivelRequisicion
from .models import NivelRequisicion
from .models import EstadoRequisicion
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect

def requisiciones(request):
    obj=Requisicion.objects.all()
    context ={'requisiciones':obj}
    return render(request, 'requisiciones/requisiciones.html', context)


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
    context ={'req': req}
    return render(request, 'requisiciones/requisiciones-agregar-2.html', context)