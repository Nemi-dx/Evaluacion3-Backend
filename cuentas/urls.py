from django.urls import path
from cuentas import views

urlpatterns = [
    path("signup/", views.SignUpView.as_view(), name="signup"),
    path("usuarios/", views.usuarioLista, name="ListaUsuarios"),
    path("addUsuario/", views.usuarioRegistro, name="addUsuario"),
    path("editarUsuario/<int:id>", views.usuarioEditar, name="editarUsuario"),
    path("eliminarUsuario/<int:id>", views.usuarioEliminar, name="eliminarUsuario"),
]