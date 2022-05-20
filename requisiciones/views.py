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
from productos.models import *

def requisiciones(request):
    obj=Requisicion.objects.all()
    context ={'requisiciones':obj}
    return render(request, 'requisiciones/requisiciones.html', context)


def requisicionCrear(request):
    niveles=NivelRequisicion.objects.all()
    context ={'niveles':niveles}
    return render(request, 'requisiciones/requisiciones-agregar-1.html', context)