from django.shortcuts import render
from cuentas.views import rolActual


# Create your views here.
def home(request):
    # si entra el superusuario, se le crea su perfil de Administrador
    rolActual(request)
    return render(request, 'core/home.html')