from django.db import models

# Create your models here.

class CategoriaProducto(models.Model):
    id =models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50)
    codigo = models.CharField(max_length=10)
    habilitada = models.BooleanField()

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "pro_categoria_producto"



class Producto(models.Model):
    id =models.AutoField(primary_key=True)
    marca_id =  models.IntegerField(null=True)
    precio = models.CharField(max_length=10)
    caracteristica = models.BooleanField()
    color = models.CharField(max_length=10)
    utilidad = models.CharField(max_length=10)
    descripcion = models.CharField(max_length=10)
    garantia = models.CharField(max_length=10)
    nombre = models.CharField(max_length=10)
    url_imagen_producto = models.CharField(max_length=10)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = "pro_producto"

class Marca(models.Model):
    id = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=200)

    class Meta:
        db_table = "pro_marca"

    def __str__(self):
        return self.marca
