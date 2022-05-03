from django.db import models

# Create your models here.

class CategoriaProducto(models.Model):
    id =models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    codigo = models.CharField(max_length=10)
    habilitada = models.BooleanField()

    def __str__(self):
        return self.Nombre

    class Meta:
        db_table = "pro_categoria_producto"


