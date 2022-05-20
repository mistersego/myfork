from cProfile import label
from dataclasses import field
from tabnanny import verbose
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
        if not(re.match('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$',correo)):
            self.errors['correo'] = self.error_class(['Formato de correo electrónico inválido.'])

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

      
        model = Proveedor
        #fields = "__all__"
        fields = ['proveedor','compania','representante_legal','direccion_organizacion'
        ,'telefono','fax','movil','correo','website','tipo_organizacion_id','nit','nrc'
        ,'periodo_negocio','rubro_empresa_id','estado','url_copia_autenticada','razon_social']
        widgets = {
            'proveedor': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'compania': TextInput(attrs={
                'class': "form-control",
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
                'placeholder' : 'Ej.: +###########'
            }),
            'fax': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
                'placeholder' : 'Ej.: +###########'
            }),
            'movil': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',
                'placeholder' : 'Ej.: +###########'                   
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
                'placeholder' : '####-######-###-#'
            }),
            'nrc': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',     
                'placeholder' : '####-#'                   
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


class ProveedorEditForm(ModelForm):

    def clean(self):
        
        super(ProveedorEditForm, self).clean()

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
        if not(re.match('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$',correo)):
            self.errors['correo'] = self.error_class(['Formato de correo electrónico inválido.'])

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
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),
            'compania': TextInput(attrs={
                'class': "form-control",
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
                'placeholder' : 'Ej.: +###########'
            }),
            'fax': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
                'placeholder' : 'Ej.: +###########'
            }),
            'movil': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',
                'placeholder' : 'Ej.: +###########'                   
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
                'placeholder' : '####-######-###-#'
            }),
            'nrc': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',     
                'placeholder' : '####-#'                   
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


class ReferenciaForm(ModelForm):

    class Meta:        

        query = TipoReferencia.objects.all()
        tipos_choices = []
        
        for q in query:
            tipos_choices.append([q.id,q.referencia])

        model = Referencia
        #fields = "__all__"
        fields = ['nombre_referencia','nombre_contacto','telefono_contacto','tipo_referencia_id','valor']

        widgets = {
            'nombre_referencia': TextInput(attrs={
                'class': "form-control col-md-6",
                'style': 'max-width:inherit;',                        
            }),
            'nombre_contacto': TextInput(attrs={
                'class': "form-control col-md-6",
                'style': 'max-width:inherit;',                        
            }),
            'telefono_contacto': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),                   
            'tipo_referencia_id': Select(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;'                                      
            },choices=tipos_choices),            
            'valor': NumberInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),         
        }

        labels = {
            'tipo_referencia_id' : 'Tipo de referencia',
            'telefono_contacto' : 'Teléfono',
            'nombre_referencia' : 'Nombre de referencia',
            'nombre_contacto': 'Nombre de contacto'
        }


class PersonalForm(ModelForm):
    class Meta:
        
        model = Personal

        fields = ['nombre','tipo_personal']

        widgets = {           
            'nombre': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),                                      
            'tipo_personal': TextInput(attrs={
                'class': "form-control",
                'style': 'max-width:inherit;',                        
            }),         
        }

        labels = {
            'tipo_personal' : 'Puesto',
            'nombre': 'Nombre'
        }


class PersonalClaveForm(ModelForm):


    firma = FileField(required=False,label='Firma',widget=FileInput(attrs={
                    'class': "form-control",
                    'style': 'max-width:inherit;',                        
                }))

    def clean(self):
        
        super(PersonalClaveForm, self).clean()

        nombre = self.cleaned_data.get('nombre')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s]){5,200}$', nombre)):
            self._errors['nombre'] = self.error_class(['El nombre debe incluir de 5 a 200 caracteres y no contener números.'])

        cargo = self.cleaned_data.get('cargo')
        if not (re.match('^([a-zA-ZÀ-ÿ\u00f1\u00d1\s0-9]){5,200}$', cargo)):
            self._errors['cargo'] = self.error_class(['El cargo debe incluir de 5 a 200 caracteres.'])
        

        return self.cleaned_data
    
    class Meta:
        model = PersonalClave

        #fields = ['nombre','cargo','firma','proveedor_id']
        fields = '__all__'
        
        widgets = {           
                'nombre': TextInput(attrs={
                    'class': "form-control",
                    'style': 'max-width:inherit;',                        
                }),                                      
                'cargo': TextInput(attrs={
                    'class': "form-control",
                    'style': 'max-width:inherit;',                        
                }),
                'proveedor_id': NumberInput(attrs={
                    'hidden': True,
                    'style': 'max-width:inherit;',                                                                
                }), 
        }
        labels = {
            'proveedor_id' : ""
        }