from django.shortcuts import render
from django.urls import reverse, reverse_lazy
from django.http import HttpResponseRedirect
from django.views.generic import CreateView
from cuentas.models import Perfil
from . import forms


# Create your views here.

class SignUpView(CreateView):
    form_class = forms.RegistroForm
    success_url = reverse_lazy("login")
    template_name = "registration/signup.html"


# Devuelve el rol del usuario que inició sesión 
def rolActual(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            Perfil.objects.update_or_create(user=request.user, defaults={'rol': 'admin'})
        return request.user.perfil.rol
    return ''


# ---------- Gestión de usuarios ----------
def usuarioLista(request):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    perfiles = Perfil.objects.all()
    data = {'perfiles': perfiles}
    return render(request, 'cuentas/usuarios.html', data)


def usuarioRegistro(request):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    form = forms.UsuarioForm()
    if request.method == 'POST':
        form = forms.UsuarioForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaUsuarios'))
    data = {'form': form, 'admin_registra': True}
    return render(request, 'registration/signup.html', data)


def usuarioEditar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    perfil = Perfil.objects.get(id=id)
    datos = {
        'first_name': perfil.user.first_name,
        'last_name': perfil.user.last_name,
        'email': perfil.user.email
    }
    form = forms.PerfilForm(instance=perfil, initial=datos)
    if request.method == 'POST':
        form = forms.PerfilForm(request.POST, instance=perfil)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaUsuarios'))
    data = {'form': form, 'titulo': 'Editar usuario ' + perfil.user.username}
    return render(request, 'formulario.html', data)


def usuarioEliminar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    perfil = Perfil.objects.get(id=id)
    perfil.user.delete()
    return HttpResponseRedirect(reverse('ListaUsuarios'))