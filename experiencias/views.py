from django.shortcuts import render
from experiencias.models import Categoria, Experiencia, Inscripcion
from cuentas.views import rolActual
from . import forms
from django.http import HttpResponseRedirect
from django.urls import reverse


# Create your views here.

# ---------- Categorías ----------
def categoriaLista(request):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    categorias = Categoria.objects.all()
    data = {'categorias': categorias}
    return render(request, 'experiencias/categorias.html', data)


def categoriaRegistro(request):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    form = forms.CategoriaForm()
    if request.method == 'POST':
        form = forms.CategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaCategorias'))
    data = {'form': form, 'titulo': 'Registro de Categoría'}
    return render(request, 'formulario.html', data)


def categoriaEditar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    categoria = Categoria.objects.get(id=id)
    form = forms.CategoriaForm(instance=categoria)
    if request.method == 'POST':
        form = forms.CategoriaForm(request.POST, instance=categoria)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaCategorias'))
    data = {'form': form, 'titulo': 'Editar Categoría'}
    return render(request, 'formulario.html', data)


def categoriaEliminar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    categoria = Categoria.objects.get(id=id)
    categoria.delete()
    return HttpResponseRedirect(reverse('ListaCategorias'))


# ---------- Experiencias ----------
def experienciaLista(request):
    rol = rolActual(request)
    if rol == 'admin':
        experiencias = Experiencia.objects.all()
    elif rol == 'guia':
        experiencias = Experiencia.objects.filter(creador=request.user)
    else:
        return HttpResponseRedirect(reverse('home'))
    data = {'experiencias': experiencias}
    return render(request, 'experiencias/experiencias.html', data)


def experienciaRegistro(request):
    rol = rolActual(request)
    if rol != 'admin' and rol != 'guia':
        return HttpResponseRedirect(reverse('home'))
    form = forms.ExperienciaForm()
    if request.method == 'POST':
        form = forms.ExperienciaForm(request.POST)
        if form.is_valid():
            experiencia = form.save(commit=False)
            experiencia.creador = request.user
            experiencia.save()
            return HttpResponseRedirect(reverse('ListaExperiencias'))
    data = {'form': form, 'titulo': 'Registro de Experiencia'}
    return render(request, 'formulario.html', data)


def experienciaEditar(request, id):
    rol = rolActual(request)
    if rol == 'admin':
        experiencia = Experiencia.objects.filter(id=id).first()
    elif rol == 'guia':
        experiencia = Experiencia.objects.filter(id=id, creador=request.user).first()
    else:
        return HttpResponseRedirect(reverse('home'))
    # si no existe, o es de otro guía, vuelve al listado
    if experiencia is None:
        return HttpResponseRedirect(reverse('ListaExperiencias'))
    form = forms.ExperienciaForm(instance=experiencia)
    if request.method == 'POST':
        form = forms.ExperienciaForm(request.POST, instance=experiencia)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaExperiencias'))
    data = {'form': form, 'titulo': 'Editar Experiencia'}
    return render(request, 'formulario.html', data)


def experienciaEliminar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    experiencia = Experiencia.objects.get(id=id)
    experiencia.delete()
    return HttpResponseRedirect(reverse('ListaExperiencias'))


# ---------- Turista ----------
def catalogo(request):
    if rolActual(request) != 'turista':
        return HttpResponseRedirect(reverse('home'))
    experiencias = Experiencia.objects.filter(activo=True, categoria__activo=True)
    inscritas = Inscripcion.objects.filter(usuario=request.user).values_list('experiencia_id', flat=True)
    data = {'experiencias': experiencias, 'inscritas': inscritas}
    return render(request, 'experiencias/catalogo.html', data)


def inscribirse(request, id):
    if rolActual(request) != 'turista':
        return HttpResponseRedirect(reverse('home'))
    experiencia = Experiencia.objects.get(id=id)
    ya_inscrito = Inscripcion.objects.filter(usuario=request.user, experiencia=experiencia).exists()
    hay_cupo = experiencia.inscripcion_set.count() < experiencia.cupo_maximo
    if hay_cupo and not ya_inscrito:
        Inscripcion.objects.create(usuario=request.user, experiencia=experiencia)
    return HttpResponseRedirect(reverse('ListaReservas'))


def cancelarReserva(request, id):
    if rolActual(request) != 'turista':
        return HttpResponseRedirect(reverse('home'))
    # solo puede cancelar reservas propias y pendientes
    reserva = Inscripcion.objects.filter(id=id, usuario=request.user, estado_pago='pendiente').first()
    if reserva is not None:
        reserva.delete()
    return HttpResponseRedirect(reverse('ListaReservas'))


# ---------- Reservas----------
def reservaLista(request):
    rol = rolActual(request)
    if rol == 'admin':
        reservas = Inscripcion.objects.all()
    elif rol == 'turista':
        reservas = Inscripcion.objects.filter(usuario=request.user)
    else:
        return HttpResponseRedirect(reverse('home'))
    data = {'reservas': reservas}
    return render(request, 'experiencias/reservas.html', data)


def reservaRegistro(request):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    form = forms.ReservaForm()
    if request.method == 'POST':
        form = forms.ReservaForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaReservas'))
    data = {'form': form, 'titulo': 'Registro de Reserva'}
    return render(request, 'formulario.html', data)


def reservaEditar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    reserva = Inscripcion.objects.get(id=id)
    form = forms.ReservaForm(instance=reserva)
    if request.method == 'POST':
        form = forms.ReservaForm(request.POST, instance=reserva)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('ListaReservas'))
    data = {'form': form, 'titulo': 'Editar Reserva'}
    return render(request, 'formulario.html', data)


def reservaEliminar(request, id):
    if rolActual(request) != 'admin':
        return HttpResponseRedirect(reverse('home'))
    reserva = Inscripcion.objects.get(id=id)
    reserva.delete()
    return HttpResponseRedirect(reverse('ListaReservas'))