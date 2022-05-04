from django.shortcuts import render
from .models import RubroEmpresa
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse

def rubrosEmpresas(request):
    rubros=RubroEmpresa.objects.all()
    context ={'rubros':rubros}
    return render(request, 'rubros/rubros.html', context)


def obtenerRubroEmpresa(request,  id):
    rubro=RubroEmpresa.objects.get(pk=id)
    context ={'rubro':rubro}
    return render(request, 'rubros/rubros-edit.html', context)


def eliminarRubroEmpresa(request, id):
    rubro = RubroEmpresa.objects.get(id=id)
    rubro.delete()
    messages.success(request, 'Rubro eliminada correctamente', extra_tags='danger')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))    


def editarRubroEmpresa(request):
    #variables de request
    nombreGet =request.GET["nombre"]
    idGet=request.GET["id"]
    #variables de request
    rubro=RubroEmpresa.objects.get(pk=idGet)

    rubro.rub=nombreGet
    rubro.save()
    messages.success(request, 'Rubro actualizado correctamente', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def guardarRubro( request):
    #variables de request
    nombreGet =request.GET["nombre"]
    #variables de request
    rubro = RubroEmpresa(rubro = nombreGet)
    
    rubro.save()
    messages.success(request, 'Rubro agregado correctamente', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
