import re

from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import (AuthenticationForm, PasswordChangeForm,
                                       UserChangeForm, UserCreationForm)
from django.core.exceptions import ValidationError


class EmailAuthenticationForm(AuthenticationForm):
    username = forms.EmailField()


User = get_user_model()


class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True)
    birth_date = forms.DateField(required=True)
    occupation = forms.CharField(max_length=150, required=True)
    cpf = forms.CharField(required=True)
    phone = forms.CharField(required=True)

    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "email", "birth_date", "occupation",
                  "cpf", "phone", "password1", "password2")

    def clean_cpf(self):
        cpf = self.cleaned_data.get('cpf')

        # Remove todos os caracteres não numéricos
        cpf = re.sub(r'\D', '', cpf)

        if len(cpf) != 11:
            raise ValidationError('CPF deve ter 11 dígitos.')

        cpf = list(map(int, cpf))

        novo_cpf = cpf[:9]

        while len(novo_cpf) < 11:
            r = sum([(len(novo_cpf)+1-i)*v for i,
                    v in enumerate(novo_cpf)]) % 11

            if r > 1:
                f = 11 - r
            else:
                f = 0
            novo_cpf.append(f)

        if novo_cpf == cpf:
            # Converta a lista de volta para uma string
            return ''.join(map(str, cpf))
        else:
            raise ValidationError('CPF inválido.')

    def clean_phone(self):
        phone = self.cleaned_data.get('phone')

        # Remove todos os caracteres não numéricos
        phone = re.sub(r'\D', '', phone)

        # Adicione aqui a sua lógica de validação do telefone
        if not re.match(r'^\d{10,13}$', phone):
            raise ValidationError(
                'Telefone inválido. Deve ter entre 10 e 13 dígitos.')

        return phone

    def clean_email(self):
        email = self.cleaned_data.get('email')

        # Verifica se o e-mail já está sendo usado por outro usuário
        if User.objects.filter(email=email).exists():
            raise ValidationError('Este e-mail já está sendo usado.')

        return email

    def clean(self):
        cleaned_data = super().clean()
        password1 = cleaned_data.get('password1')
        password2 = cleaned_data.get('password2')

        if password1 and password2 and password1 != password2:
            self.add_error('password2', 'As senhas não coincidem.')

        return cleaned_data

    def save(self, commit=True):
        user = super().save(commit=False)
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.email = self.cleaned_data["email"]
        user.birth_date = self.cleaned_data["birth_date"]
        user.occupation = self.cleaned_data["occupation"]
        user.cpf = self.cleaned_data["cpf"]
        user.phone = self.cleaned_data["phone"]
        if commit:
            user.save()
        return user


class CustomUserUpdateForm(forms.ModelForm):
    password = forms.CharField(widget=forms.HiddenInput(), required=False)

    class Meta:
        model = User
        fields = ["username", "first_name", "last_name",
                  "birth_date", "occupation", "cpf", "phone"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["birth_date"].disabled = True
        self.fields["cpf"].disabled = True


class AvatarUploadForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['avatar']


class EmailPasswordUpdateForm(forms.Form):
    email = forms.EmailField(label='Novo Email', required=False)
    password = forms.CharField(
        label='Nova Senha', widget=forms.PasswordInput, required=False)
    password_confirmation = forms.CharField(
        label='Confirmar Nova Senha', widget=forms.PasswordInput, required=False)

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        password_confirmation = cleaned_data.get('password_confirmation')

        if password and password_confirmation and password != password_confirmation:
            self.add_error('password_confirmation', 'As senhas não coincidem.')

        return cleaned_data
