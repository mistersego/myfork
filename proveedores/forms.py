from django.forms import *
from .models import *
from django.core.validators import RegexValidator
import re

# creating a form
class ProveedorForm(ModelForm):

    def clean(self):
        
        super(ProveedorForm, self).clean()

        proveedor = self.cleaned_data.get('proveedor')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s0-9]){5,200}$', proveedor)):
            self._errors['proveedor'] = self.error_class(['El proveedor debe incluir de 5 a 200 caracteres.'])

        compania = self.cleaned_data.get('compania')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s0-9]){5,200}$', compania)):
            self._errors['compania'] = self.error_class(['La compañía debe incluir de 5 a 200 caracteres.'])

        representante_legal = self.cleaned_data.get('representante_legal')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s]){5,200}$', representante_legal)):
            self._errors['representante_legal'] = self.error_class(['El representante legal debe incluir de 5 a 200 caracteres y no incluir números.'])

        direccion_organizacion = self.cleaned_data.get('direccion_organizacion')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s0-9#.,]){5,300}$', direccion_organizacion)):
            self._errors['direccion_organizacion'] = self.error_class(['La dirección debe incluir de 5 a 300 caracteres.'])

        telefono = self.cleaned_data.get('telefono')
        if not(re.match('^[+]{1}([0-9]){6,14}$', telefono)):
            self.errors['telefono'] = self.error_class(['Formato de teléfono inválido.'])

        fax = self.cleaned_data.get('fax')
        if not(re.match('^[+]{1}([0-9]){6,14}$', fax)):
            self.errors['fax'] = self.error_class(['Formato de fax inválido.'])

        movil = self.cleaned_data.get('movil')
        if not(re.match('^[+]{1}([0-9]){6,14}$', movil)):
            self.errors['movil'] = self.error_class(['Formato de móvil inválido.'])
        
        correo = self.cleaned_data.get('correo')

        website = self.cleaned_data.get('website')
        if not(re.match('(\b(https?|ftp|file)://)?[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]', website)):
            self.errors['website'] = self.error_class(['Formato de url inválido.'])

        nit = self.cleaned_data.get('nit')
        if not(re.match('^([0-9]{4}-([0-9]{6})-([0-9]{3})-[0-9]{1})$', nit)):
            self.errors['nit'] = self.error_class(['Formato de NIT inválido.'])

        nrc = self.cleaned_data.get('nrc')
        if not(re.match('^([0-9]{4}-([0-9]{1}))$', nrc)):
            self.errors['nrc'] = self.error_class(['Formato de NRC inválido.'])

        periodo_negocio = self.cleaned_data.get('periodo_negocio') 
        if periodo_negocio < 0: 
            self.errors['periodo_negocio'] = self.error_class(['Valor ingresado inválido.'])
        
        estado = self.cleaned_data.get('estado')
        if estado < 0: 
            self.errors['eestado'] = self.error_class(['Valor ingresado inválido.'])

        razon_social =  self.cleaned_data.get('razon_social')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s0-9]){5,200}$', razon_social)):
            self._errors['razon_social'] = self.error_class(['La razón social debe incluir de 5 a 200 caracteres.'])

        calificacion =  self.cleaned_data.get('calificacion')
        if not (re.match('^([a-dA-D]){1}$', calificacion)):
            self._errors['calificacion'] = self.error_class(['Formato de calificación inválido.'])

        return self.cleaned_data
    
    class Meta:        
        query = TipoOrganizacion.objects.all()
        organizacion_choices = []
        
        for q in query:
            organizacion_choices.append([q.id,q.tipo])
        
        query = RubroEmpresa.objects.all()
        rubros_choices = []
        for q in query:
            rubros_choices.append([q.id,q.rubro])

        calificacion_choices = []
        calificacion_choices.append(['A','A'])
        calificacion_choices.append(['B','B'])
        calificacion_choices.append(['C','C'])
        calificacion_choices.append(['D','D'])

        model = Proveedor
        fields = "__all__"
        widgets = {
            'proveedor': TextInput(attrs={
                'class': "form-control col-md-6",
                'style': 'max-width:inherit;',                        
            }),
            'compania': TextInput(attrs={
                'class': "form-control col-md-6",
                'style': 'max-width:inherit;'
            }),
            'representante_legal': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'direccion_organizacion': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'telefono': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'fax': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'movil': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'correo': EmailInput(attrs={
                'class': "form-control", 
                'style': 'max-width:inherit;',                
            }),
            'website': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'tipo_organizacion_id': Select(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            },choices=organizacion_choices),
            'nit': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'nrc': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'periodo_negocio': NumberInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'rubro_empresa_id': Select(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            },choices=rubros_choices),
            'estado': NumberInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            }),
            'url_copia_autenticada': FileInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            }),
            'razon_social': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            }),
            'calificacion': Select(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            },choices = calificacion_choices),
        }
        labels = {
            'compania': 'Compañía',
            'direccion_organizacion': 'Dirección',
            'telefono': 'Teléfono',
            'movil': 'Móvil',
            'correo' : 'Correo Electrónico',
            'website': 'Sitio Web',
            'tipo_organizacion_id': 'Tipo de Organización',
            'nit':'NIT',
            'nrc':'NRC',
            'url_copia_autenticada':'Copia Autenticada',
            'razon_social':'Razón Social',
            'calificacion':'Calificación',
            'rubro_empresa_id':'Rubro Empresa'
        }