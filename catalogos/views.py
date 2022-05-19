from pkg_resources import require
from .models import Area
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render


def areas(request):
    areas=Area.objects.all()
    context ={'areas':areas}
    return render(request, 'area/areas.html', context)


def guardarArea( request):
    #variables de request
    nombreGet =request.GET["nombre"]
    #variables de request

    areas=Area.objects.filter(area=nombreGet)
    if areas:
        #return HttpResponse("codigo duplicado")
        messages.error(request, 'No se ha podido guardar la categoria porque ya existe.', extra_tags='danger')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        area = Area(area=nombreGet,
                    activo=True)
        area.save()
        messages.success(request, 'Area agregada correctamente', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def cambioEstadoArea(request,  id):
    area=Area.objects.get(pk=id)
    if area.activo==1:
        area.activo=0
        area.save()
    else:
        area.activo=1
        area.save()

    messages.success(request, 'El cambio de estado del area se ha realizado correctamente', extra_tags='success')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def obtenerArea(request,  id):
    area=Area.objects.get(pk=id)
    context ={'area':area}
    return render(request, 'area/area-editar.html', context)



def editarArea(request):
      #variables de request
    nombreGet =request.GET["nombre"]
    idGet=request.GET["id"]
    #variables de request
    areas=Area.objects.filter(area=nombreGet).exclude(id=idGet)
    area=Area.objects.get(pk=idGet)
    if areas:
        messages.error(request, 'No se ha podido actualizar el area porque el nombre ya existe.', extra_tags='warning')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        area.area=nombreGet
        area.save()
        messages.success(request, 'Area actualizada correctamente', extra_tags='success')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
