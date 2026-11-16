from django import forms
from experiencias.models import Categoria, Experiencia, Inscripcion


class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = '__all__'
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'rows': 3})
        }


class ExperienciaForm(forms.ModelForm):
    class Meta:
        model = Experiencia
        fields = ['titulo', 'descripcion', 'precio', 'cupo_maximo', 'fecha', 'categoria', 'activo']
        widgets = {
            'titulo': forms.TextInput(attrs={'class': 'form-control'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'precio': forms.NumberInput(attrs={'class': 'form-control'}),
            'cupo_maximo': forms.NumberInput(attrs={'class': 'form-control'}),
            'fecha': forms.DateTimeInput(format='%Y-%m-%dT%H:%M', attrs={'class': 'form-control', 'type': 'datetime-local'}),
            'categoria': forms.Select(attrs={'class': 'form-control'})
        }


class ReservaForm(forms.ModelForm):
    class Meta:
        model = Inscripcion
        fields = ['usuario', 'experiencia', 'estado_pago']
        widgets = {
            'usuario': forms.Select(attrs={'class': 'form-control'}),
            'experiencia': forms.Select(attrs={'class': 'form-control'}),
            'estado_pago': forms.Select(attrs={'class': 'form-control'})
        }