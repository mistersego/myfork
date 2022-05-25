from django.db import models
from django.conf import settings
import os
# Create your models here.

class Area(models.Model):
    id =models.AutoField(primary_key=True)
    area = models.CharField(max_length=250)
    activo= models.BooleanField()
    
    def __str__(self):
        return self.area

    class Meta:
        db_table = "ctl_area"


class Cargo(models.Model):
    id =models.AutoField(primary_key=True)
    cargo = models.CharField(max_length=250)
    area_id = models.IntegerField(null=False)
    activo = models.BooleanField()
    
    def __str__(self):
        return self.cargo

    class Meta:
        db_table = "ctl_cargo"