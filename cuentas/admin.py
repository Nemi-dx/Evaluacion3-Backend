from django.contrib import admin
from cuentas.models import Perfil

# Register your models here.

class PerfilAdmin(admin.ModelAdmin):
    list_display = ['user', 'rol']

admin.site.register(Perfil, PerfilAdmin)