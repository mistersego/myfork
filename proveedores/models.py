from django.db import models

# Create your models here.

class RubroEmpresa(models.Model):
    id =models.AutoField(primary_key=True)
    rubro = models.CharField(max_length=100)
    

    def __str__(self):
        return self.rubro

    class Meta:
        db_table = "prove_rubro_empresa"


