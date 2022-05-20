from django.db import models

# Create your models here.

class Requisicion(models.Model):
    id =models.AutoField(primary_key=True)
    nivel_id = models.IntegerField(null=False)
    jefe_id = models.IntegerField(null=False)
    fecha_requisicion= models.CharField(max_length=20)
    fecha_estimada= models.CharField(max_length=20)
    usuario_id = models.IntegerField(null=False)
    estado_id = models.IntegerField(null=False)

    def __str__(self):
        return self.usuario_id

    class Meta:
        db_table = "req_requisicion"



class NivelRequisicion(models.Model):
    id =models.AutoField(primary_key=True)
    nivel= models.CharField(max_length=200)

    def __str__(self):
        return self.nivel

    class Meta:
        db_table = "req_nivel"


class EstadoRequisicion(models.Model):
    id =models.AutoField(primary_key=True)
    estado= models.CharField(max_length=200)

    def __str__(self):
        return self.estado

    class Meta:
        db_table = "req_estado"

