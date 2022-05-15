from django.db import models
from django.conf import settings
import os
# Create your models here.

class RubroEmpresa(models.Model):
    id =models.AutoField(primary_key=True)
    rubro = models.CharField(max_length=100)
    

    def __str__(self):
        return self.rubro

    class Meta:
        db_table = "prove_rubro_empresa"

class TipoOrganizacion(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=100)

    class Meta:
        db_table = "prove_tipo_organizacion"

class Proveedor(models.Model):

    id = models.AutoField(primary_key=True,null=False)
    proveedor = models.CharField(max_length=200,null=False)
    compania = models.CharField(max_length=200,null=False)
    representante_legal = models.CharField(max_length=200,null=False)
    direccion_organizacion = models.CharField(max_length=300,null=True,default=None)
    telefono = models.CharField(max_length=100,null=True,default=None)
    fax = models.CharField(max_length=100,null=True,default=None)
    movil = models.CharField(max_length=100,null=True,default=None)
    correo = models.CharField(max_length=100,null=True,default=None)
    website = models.CharField(max_length=100,null=True,default=None)
    #tipo_organizacion = models.ForeignKey(TipoOrganizacion, on_delete=models.CASCADE)#foreignkey agrega _id aparentemente
    tipo_organizacion_id = models.IntegerField(null=False)
    nit = models.CharField(max_length=100,null=False)
    nrc = models.CharField(max_length=100,null=True,default=None)
    periodo_negocio = models.IntegerField(null=False,default=None)
    #rubro_empresa = models.ForeignKey(RubroEmpresa,on_delete=models.CASCADE)#foreignkey agrega _id aparentemente
    rubro_empresa_id = models.IntegerField(null=False)
    estado = models.IntegerField(null=False,default=None)
    url_copia_autenticada = models.FileField(null=False, upload_to='copias_autenticadas/')
    razon_social =  models.CharField(max_length=200,null=True,default=None)
    calificacion =  models.CharField(max_length=100,null=True,default=None)

    def delete_file(self, *args, **kwargs):
        os.remove(os.path.join(settings.MEDIA_ROOT, self.url_copia_autenticada.name))
        
    class Meta:
        db_table = "prove_proveedor"


class TipoReferencia(models.Model):
    id = models.AutoField(primary_key=True,null=False)
    referencia = models.CharField(max_length=100,null=False)
    class Meta:
        db_table = "prove_tipo_referencia"

class Referencia(models.Model):
    id = models.AutoField(primary_key=True,null=False)
    nombre_referencia = models.CharField(max_length=200,null=False)
    nombre_contacto = models.CharField(max_length=200,null=False)    
    telefono_contacto = models.CharField(max_length=100,null=True,default=None)
    valor = models.DecimalField(max_digits=10,decimal_places=0,null=False)
    tipo_referencia_id = models.IntegerField(null=False)
    proveedor_id = models.IntegerField(null=False)

    class Meta:
        db_table = "prove_referencia"