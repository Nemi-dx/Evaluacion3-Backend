from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Categoria(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


class Experiencia(models.Model):
    titulo = models.CharField(max_length=150)
    descripcion = models.TextField()
    precio = models.PositiveIntegerField()
    cupo_maximo = models.PositiveIntegerField()
    fecha = models.DateTimeField()
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    creador = models.ForeignKey(User, on_delete=models.CASCADE)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.titulo


class Inscripcion(models.Model):
    ESTADOS = [
        ('pendiente', 'Pendiente'),
        ('confirmado', 'Confirmado'),
    ]
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    experiencia = models.ForeignKey(Experiencia, on_delete=models.CASCADE)
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)
    estado_pago = models.CharField(max_length=10, choices=ESTADOS, default='pendiente')