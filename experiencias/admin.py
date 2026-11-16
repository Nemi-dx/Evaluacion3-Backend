from django.contrib import admin
from experiencias.models import Categoria, Experiencia, Inscripcion

# Register your models here.

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'activo']


class ExperienciaAdmin(admin.ModelAdmin):
    list_display = ['titulo', 'categoria', 'precio', 'cupo_maximo', 'fecha', 'creador', 'activo']


class InscripcionAdmin(admin.ModelAdmin):
    list_display = ['usuario', 'experiencia', 'fecha_inscripcion', 'estado_pago']


# Register your models here.
admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Experiencia, ExperienciaAdmin)
admin.site.register(Inscripcion, InscripcionAdmin)