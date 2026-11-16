from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Perfil(models.Model):
    ROLES = [
        ('admin', 'Administrador'),
        ('guia', 'Guía / Operador'),
        ('turista', 'Turista / Cliente'),
    ]
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    rol = models.CharField(max_length=10, choices=ROLES)