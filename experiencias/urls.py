from django.urls import path
from experiencias import views

urlpatterns = [
    path('categorias/', views.categoriaLista, name="ListaCategorias"),
    path('addCategoria/', views.categoriaRegistro, name="addCategoria"),
    path('editarCategoria/<int:id>', views.categoriaEditar, name="editarCategoria"),
    path('eliminarCategoria/<int:id>', views.categoriaEliminar, name="eliminarCategoria"),

    path('', views.experienciaLista, name="ListaExperiencias"),
    path('addExperiencia/', views.experienciaRegistro, name="addExperiencia"),
    path('editarExperiencia/<int:id>', views.experienciaEditar, name="editarExperiencia"),
    path('eliminarExperiencia/<int:id>', views.experienciaEliminar, name="eliminarExperiencia"),

    path('catalogo/', views.catalogo, name="catalogo"),
    path('inscribirse/<int:id>', views.inscribirse, name="inscribirse"),
    path('cancelarReserva/<int:id>', views.cancelarReserva, name="cancelarReserva"),
    path('reservas/', views.reservaLista, name="ListaReservas"),
    path('addReserva/', views.reservaRegistro, name="addReserva"),
    path('editarReserva/<int:id>', views.reservaEditar, name="editarReserva"),
    path('eliminarReserva/<int:id>', views.reservaEliminar, name="eliminarReserva"),
]