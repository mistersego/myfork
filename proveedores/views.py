from multiprocessing import context
import os
from django.shortcuts import get_object_or_404, render
from .models import RubroEmpresa, TipoOrganizacion, Proveedor
from django.conf import settings
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.http import JsonResponse
from django.contrib import messages
from django.urls import reverse
from .forms import *

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

    rubro.rubro=nombreGet
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

#------------------------PROVEEDORES--------------------------------

def proveedores(request):    
    proveedores = Proveedor.objects.raw('select * from ((prove_proveedor as pp inner join prove_tipo_organizacion as pto on pp.tipo_organizacion_id = pto.id) inner join prove_rubro_empresa as pre on pp.rubro_empresa_id = pre.id);')
    context ={'proveedores':proveedores}
    return render(request,'proveedores/proveedores.html', context)

def create_proveedor(request):
    
    if request.method == 'POST':
        form = ProveedorForm(request.POST, request.FILES)
        if form.is_valid():            
            form.save()
            messages.success(request, 'Proveedor agregado correctamente.', extra_tags='success')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        else:
            messages.success(request, 'Existen errores en el formulario.', extra_tags='danger')
            context = {'form':ProveedorForm(request.POST,request.FILES)}
            return render(request, "proveedores/create_proveedor.html", context)
    else:
        context = {'form':ProveedorForm()}
        return render(request, "proveedores/create_proveedor.html", context)


def eliminar_proveedor(request,id):
    proveedor = get_object_or_404(Proveedor, id = id)
    try:
        proveedor.delete_file()
        proveedor.delete()
        messages.success(request, 'Proveedor eliminado correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    except:
        messages.success(request, 'Ha ocurrido un error.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    

def update_proveedor(request,id):    
    proveedor = get_object_or_404(Proveedor, id = id)
    name = proveedor.url_copia_autenticada.name

    if request.method == 'POST':
            
        form = ProveedorForm(request.POST, request.FILES,instance=proveedor)
        if form.is_valid():                        
            print(name)
            if name != None:
                os.remove(os.path.join(settings.MEDIA_ROOT, name))
            form.save()
            messages.success(request, 'Proveedor editado correctamente.', extra_tags='success')  
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
        else:
            messages.success(request, 'Existen errores en el formulario.', extra_tags='danger')
    else:
        form = ProveedorForm(instance=proveedor)

    context = {'form':form}
    return render(request,"proveedores/edit_proveedor.html",context)

#------------------------PROVEEDORES--------------------------------


