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
from django.db import connection


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
    #proveedores = Proveedor.objects.raw('select * from ((prove_proveedor as pp inner join prove_tipo_organizacion as pto on pp.tipo_organizacion_id = pto.id) inner join prove_rubro_empresa as pre on pp.rubro_empresa_id = pre.id);')
    proveedores = Proveedor.objects.all()
    context ={'proveedores':proveedores}
    return render(request,'proveedores/proveedores.html', context)

def detalle_proveedor(request,id):    
    proveedor = Proveedor.objects.raw('select * from ((prove_proveedor as pp inner join prove_tipo_organizacion as pto on pp.tipo_organizacion_id = pto.id) inner join prove_rubro_empresa as pre on pp.rubro_empresa_id = pre.id) WHERE pp.id = %s;',[id])
    context ={'proveedor':proveedor[0]}
    return render(request,'proveedores/detail_proveedor.html', context)

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
    try:
        proveedor = get_object_or_404(Proveedor, id = id)
        proveedor.delete_file()
        proveedor.delete()
        messages.success(request, 'Proveedor eliminado correctamente.', extra_tags='success')
        return HttpResponseRedirect('/proveedores')        
        
    except:
        messages.success(request, 'Ha ocurrido un error.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    

def update_proveedor(request,id):    
    proveedor = get_object_or_404(Proveedor, id = id)
    name = proveedor.url_copia_autenticada.name

    if request.method == 'POST':
       
        form = ProveedorEditForm(request.POST, request.FILES,instance=proveedor)
        if form.is_valid():                        
            
            try:
                file = request.FILES['url_copia_autenticada'].name
                os.remove(os.path.join(settings.MEDIA_ROOT, name))
            except:
                pass
            
            form.save()
            messages.success(request, 'Proveedor editado correctamente.', extra_tags='success')  
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
        else:
            messages.success(request, 'Existen errores en el formulario.', extra_tags='danger')
    else:
        form = ProveedorEditForm(instance=proveedor)

    context = {'form':form}
    return render(request,"proveedores/edit_proveedor.html",context)


from django.http import HttpResponse
from django.template.loader import get_template
from datetime import date 
from weasyprint import HTML, CSS
from django.template.loader import render_to_string

#import os
#os.add_dll_directory(r"C:\Program Files\GTK3-Runtime Win64\bin")

def report_proveedor(request,id):
    
    proveedor = Proveedor.objects.raw('select * from ((prove_proveedor as pp inner join prove_tipo_organizacion as pto on pp.tipo_organizacion_id = pto.id) inner join prove_rubro_empresa as pre on pp.rubro_empresa_id = pre.id) WHERE pp.id = %s;',[id])    
    context = {'proveedor': proveedor[0],'pagesize':'A4','fecha':date.today()}
    template_path = 'proveedores/reportes/report_proveedor.html'
    html = render_to_string(template_path, context)

    response = HttpResponse(content_type="application/pdf")
    response["Content-Disposition"] = "inline;nuevo.pdf"
    
    HTML(string=html,base_url=request.build_absolute_uri()).write_pdf(response)

    return response

def report_proveedores(request):
    
    try:            
        parametros = request.POST.getlist('parametros')
        orden = request.POST.getlist('order')
        parametros_query = ""
        all_fields = 0
        len_parametros = len(parametros)
        if  len_parametros> 0:
            for p in parametros:
                    parametros_query = parametros_query+p+"," 
            parametros_query = parametros_query[0:-1]
        else:
            all_fields = 1
                            
        with connection.cursor() as cursor:     
            cursor.callproc('sp_PROVEEDORES_REPORT',[parametros_query,orden,all_fields])
            
            columnas = [x[0] for x in cursor.description]

            for i in range( len(columnas)):
                if columnas[i] == "website":
                    columnas[i] = "Sitio Web"
                if columnas[i] == "tipo":
                    columnas[i] = "Tipo de Organización"
                if columnas[i] == "telefono":
                    columnas[i] = "Teléfono"
                if columnas[i] == "movil":
                    columnas[i] = "Móvil"
                if columnas[i] == "fax":
                    columnas[i] = "Fax"
                if columnas[i] == "correo":
                    columnas[i] = "Correo Electrónico"
                if columnas[i] == "compania":
                    columnas[i] = "Compañía"
                if columnas[i] == "rubro":
                    columnas[i] = "Rubro"
                if columnas[i] == "estado":
                    columnas[i] = "Estado"
                if columnas[i] == "periodo_negocio":
                    columnas[i] = "Periodo"
                if columnas[i] == "nit":
                    columnas[i] = "NIT"                
                if columnas[i] == "nrc":
                    columnas[i] = "NRC"                
                if columnas[i] == "id":
                    columnas[i] = "ID"                
                if columnas[i] == "calificacion":
                    columnas[i] = "Calificación"            
                if columnas[i] == "representante_legal":
                    columnas[i] = "Representante Legal"                
                if columnas[i] == "direccion_organizacion":
                    columnas[i] = "Dirección Organización"                
                if columnas[i] == "razon_social":
                    columnas[i] = "Razón Social"                
                    
            records = cursor.fetchall()    
            
            proveedores = []

            for row in records:
                proveedores.append(dict(zip(columnas, row)))

            context = {'proveedores': proveedores,'pagesize':'A4','fecha':date.today()}
            template_path = 'proveedores/reportes/report_proveedores.html'
            html = render_to_string(template_path, context)

            response = HttpResponse(content_type="application/pdf")
            response["Content-Disposition"] = "inline;Proveedores.pdf"
            
            HTML(string=html,base_url=request.build_absolute_uri()).write_pdf(response)
                        

            return response
        
    except:
        messages.success(request, 'Error en la ejecución del procedimiento.', extra_tags='danger') 
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    
#------------------------PROVEEDORES--------------------------------

#------------------------REFERENCIAS--------------------------------
def referencias_proveedor(request,proveedor_id):
    referencias = Proveedor.objects.raw('SELECT * FROM (prove_referencia as pr inner join prove_tipo_referencia as ptr on pr.tipo_referencia_id = ptr.id) WHERE pr.proveedor_id = %s',params=[proveedor_id])
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)
    context = {'referencias':referencias,
                'proveedor':proveedor}
    return render(request,"referencias/referencias_proveedor.html",context)

def crear_referencia(request,proveedor_id):
    if request.method == 'POST':
        nombre_referencia = request.POST['nombre_referencia']
        nombre_contacto = request.POST['nombre_contacto']
        telefono_contacto = request.POST['telefono_contacto']
        valor = request.POST['valor']
        tipo_referencia_id = request.POST['tipo_referencia_id']
        new_proveedor_id = proveedor_id

        try:            
            with connection.cursor() as cursor:                
                cursor.callproc('sp_INSERT_REFERENCIA',[nombre_referencia,nombre_contacto,telefono_contacto,valor,tipo_referencia_id,new_proveedor_id])           
                records = cursor.fetchone()            
                if records is None:
                    messages.success(request, 'Referencia agregada correctamente.', extra_tags='success') 
                    context = {'form':ReferenciaForm(),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "referencias/create_referencia.html", context)
                else:                                  
                    messages.success(request, records[0], extra_tags='danger')
                    context = {'form':ReferenciaForm(request.POST),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "referencias/create_referencia.html", context)

        except:
            messages.success(request, 'Error en la ejecución del procedimiento.', extra_tags='danger') 
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        context = {'form':ReferenciaForm(),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
        return render(request, "referencias/create_referencia.html", context)

def eliminar_referencia(request,proveedor_id,referencia_id):
    try:
        referencia = get_object_or_404(Referencia, id = referencia_id)
        referencia.delete()
        messages.success(request, 'Referencia eliminada correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
    except:
        messages.success(request, 'Ha ocurrido un error.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def editar_referencia(request,proveedor_id,referencia_id):
    referencia = get_object_or_404(Referencia, id = referencia_id)     
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)  

    if request.method == 'POST':
    
        form = ReferenciaForm(request.POST,instance=referencia)
        
        nombre_referencia = request.POST['nombre_referencia']
        nombre_contacto = request.POST['nombre_contacto']
        telefono_contacto = request.POST['telefono_contacto']
        valor = request.POST['valor']
        tipo_referencia_id = request.POST['tipo_referencia_id']
        
        try:            
            with connection.cursor() as cursor:                
                cursor.callproc('sp_UPDATE_REFERENCIA',[referencia_id,nombre_referencia,nombre_contacto,telefono_contacto,valor,tipo_referencia_id])
                records = cursor.fetchone()            
                if records is None:
                    messages.success(request, 'Referencia editada correctamente.', extra_tags='success') 
                    context = {'form':form,'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "referencias/edit_referencia.html", context)
                else:                                  
                    messages.success(request, records[0], extra_tags='danger')
                    context = {'form':form,'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "referencias/edit_referencia.html", context)

        except:
            messages.success(request, 'Error en la ejecución del procedimiento.', extra_tags='danger') 
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))         
        
    else:
        form = ReferenciaForm(instance=referencia)

    context = {'form':form,'proveedor':proveedor}
    return render(request,"referencias/edit_referencia.html",context)


#------------------------REFERENCIAS--------------------------------


#---------------------------PERSONAL--------------------------------

def  personal_proveedor(request,proveedor_id):
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)
    personal = Personal.objects.filter(proveedor_id = proveedor_id)
    context = {'proveedor':proveedor,'personal':personal}
    return render(request,"personal/personal_proveedor.html",context)

def crear_personal(request,proveedor_id):    

    if request.method == 'POST':
        nombre = request.POST['nombre']        
        tipo_personal = request.POST['tipo_personal']
        new_proveedor_id = proveedor_id

        try:            
            with connection.cursor() as cursor:                
                cursor.callproc('sp_INSERT_PERSONAL',[nombre,tipo_personal,new_proveedor_id])           
                records = cursor.fetchone()            
                if records is None:
                    messages.success(request, 'Personal agregado correctamente.', extra_tags='success') 
                    context = {'form':PersonalForm(),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "personal/create_personal.html", context)
                else:                                  
                    messages.success(request, records[0], extra_tags='danger')
                    context = {'form':PersonalForm(request.POST),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "personal/create_personal.html", context)

        except:
            messages.success(request, 'Error en la ejecución del procedimiento.', extra_tags='danger') 
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        context = {'form':PersonalForm(),'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
        return render(request, "personal/create_personal.html", context)


def editar_personal(request,proveedor_id,personal_id):
    personal = get_object_or_404(Personal, id = personal_id)   
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)  

    if request.method == 'POST':
    
        form = PersonalForm(request.POST,instance=personal)
        
        nombre = request.POST['nombre']        
        tipo_personal = request.POST['tipo_personal']

        try:            
            with connection.cursor() as cursor:                
                cursor.callproc('sp_UPDATE_PERSONAL',[personal_id,nombre,tipo_personal])
                records = cursor.fetchone()            
                if records is None:
                    messages.success(request, 'Personal editado correctamente.', extra_tags='success') 
                    context = {'form':form,'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "personal/edit_personal.html", context)
                else:                                  
                    messages.success(request, records[0], extra_tags='danger')
                    context = {'form':form,'proveedor':get_object_or_404(Proveedor,id=proveedor_id)}
                    return render(request, "personal/edit_personal.html", context)

        except:
            messages.success(request, 'Error en la ejecución del procedimiento.', extra_tags='danger') 
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
    else:
        form = PersonalForm(instance=personal)

    context = {'form':form,'proveedor':proveedor}
    return render(request,"personal/edit_personal.html",context)

def eliminar_personal(request,proveedor_id,personal_id):
    try:
        personal = get_object_or_404(Personal, id = personal_id)
        personal.delete()
        messages.success(request, 'Personal eliminado correctamente.', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
    except:
        messages.success(request, 'Ha ocurrido un error.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


#---------------------------PERSONAL--------------------------------

#----------------------PERSONAL CLAVE--------------------------------



#----------------------PERSONAL CLAVE--------------------------------
def  personal_clave_proveedor(request,proveedor_id):
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)
    personal_clave = PersonalClave.objects.filter(proveedor_id = proveedor_id)
    context = {'proveedor':proveedor,'personal_clave':personal_clave}
    return render(request,"personal_clave/personal_clave_proveedor.html",context)

def crear_personal_clave(request,proveedor_id):
    proveedor = get_object_or_404(Proveedor,id = proveedor_id)
    if request.method == 'POST':
        form = PersonalClaveForm(request.POST, request.FILES,initial={'proveedor_id':proveedor_id})
        if form.is_valid():            
            form.save()
            messages.success(request, 'Personal clave agregado correctamente.', extra_tags='success')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        else:
            messages.success(request, 'Existen errores en el formulario.', extra_tags='danger')
            context = {'form':form,'proveedor':proveedor}
            return render(request, "personal_clave/create_personal_clave.html", context)
    else:
        context = {'form':PersonalClaveForm(initial={'proveedor_id':proveedor_id}),'proveedor':proveedor}
        return render(request, "personal_clave/create_personal_clave.html", context)


def editar_personal_clave(request,proveedor_id,personal_clave_id):
    proveedor = get_object_or_404(Proveedor, id = proveedor_id)
    personal_clave = get_object_or_404(PersonalClave, id = personal_clave_id)
    name = personal_clave.firma.name

    if request.method == 'POST':
       
        form = PersonalClaveForm(request.POST, request.FILES,instance=personal_clave)
        if form.is_valid():                        
            
            try:
                file = request.FILES['firma'].name
                os.remove(os.path.join(settings.MEDIA_ROOT, name))
            except:
                pass
            
            form.save()
            messages.success(request, 'Personal clave editado correctamente.', extra_tags='success')  
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
                    
        else:
            messages.success(request, 'Existen errores en el formulario.', extra_tags='danger')
    else:
        form = PersonalClaveForm(instance=personal_clave)

    context = {'form':form,'proveedor':proveedor}
    return render(request,"personal_clave/edit_personal_clave.html",context)

def eliminar_personal_clave(request,proveedor_id,personal_clave_id):

        try:
            personal_clave = get_object_or_404(PersonalClave, id = personal_clave_id)
            personal_clave.delete_file()
            personal_clave.delete()
            messages.success(request, 'Proveedor eliminado correctamente.', extra_tags='success')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))            
            
        except:
            messages.success(request, 'Ha ocurrido un error.', extra_tags='danger')
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

