from django import forms
from django.contrib.auth.forms import UserCreationForm
from cuentas.models import Perfil


# Cuando se registra un nuevo usuario siempre queda como turista
class RegistroForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = ['username', 'email', 'first_name', 'last_name']

    def save(self):
        usuario = super().save()
        Perfil.objects.create(user=usuario, rol='turista')
        return usuario


# El administrador puede crea usuarios eligiendo el rol
class UsuarioForm(UserCreationForm):
    rol = forms.ChoiceField(choices=Perfil.ROLES)

    class Meta(UserCreationForm.Meta):
        fields = ['username', 'email', 'first_name', 'last_name']

    def save(self):
        usuario = super().save()
        Perfil.objects.create(user=usuario, rol=self.cleaned_data['rol'])
        return usuario


# El administrador puede editarel nombre, el email y el rol de un usuario
class PerfilForm(forms.ModelForm):
    first_name = forms.CharField(label='Nombre', max_length=150, required=False,widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(label='Apellido', max_length=150, required=False,widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label='Email', required=False, widget=forms.EmailInput(attrs={'class': 'form-control'}))
    field_order = ['first_name', 'last_name', 'email', 'rol']

    class Meta:
        model = Perfil
        fields = ['rol']
        widgets = {
            'rol': forms.Select(attrs={'class': 'form-control'})
        }

    def save(self):
        perfil = super().save()
        perfil.user.first_name = self.cleaned_data['first_name']
        perfil.user.last_name = self.cleaned_data['last_name']
        perfil.user.email = self.cleaned_data['email']
        perfil.user.save()
        return perfil