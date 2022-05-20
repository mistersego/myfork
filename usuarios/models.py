from django.db import models

# Create your models here.

class Usuario(models.Model):
    id =models.AutoField(primary_key=True)
    password = models.CharField(max_length=200)
    username = models.CharField(max_length=200)
   

    def __str__(self):
        return self.username

    class Meta:
        db_table = "auth_user"
