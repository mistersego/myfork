from django.db import models

# Create your models here.

class CategoriaProducto(models.Model):
    Id_CategoriaProd =models.AutoField(primary_key=True)
    Nombre = models.CharField(max_length=50)
    Codigo = models.CharField(max_length=10)
    Habilitada = models.BooleanField()

    def __str__(self):
        return self.Nombre

    class Meta:
        db_table = "productoscategorias"
