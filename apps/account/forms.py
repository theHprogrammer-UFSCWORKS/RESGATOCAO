from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm


class EmailAuthenticationForm(AuthenticationForm):
    username = forms.EmailField()

User = get_user_model()

class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(required=True)
    birth_date = forms.DateField(required=True)
    occupation = forms.CharField(max_length=150, required=True)
    cpf = forms.CharField(max_length=11, required=True)
    phone = forms.CharField(max_length=13, required=True)

    class Meta:
        model = User
        fields = ("username", "first_name", "last_name", "email", "birth_date", "occupation",
                  "cpf", "phone", "password1", "password2")

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
        #fields = ["username", "first_name", "last_name", "email", "birth_date", "occupation", "cpf", "phone"]
        fields = ["username", "first_name", "last_name", "birth_date", "occupation", "cpf", "phone"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["birth_date"].disabled = True
        self.fields["cpf"].disabled = True

class AvatarUploadForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['avatar']

from django.contrib.auth.forms import PasswordChangeForm,UserChangeForm


class EmailPasswordUpdateForm(forms.Form):
    email = forms.EmailField(label='Novo Email', required=False)
    password = forms.CharField(label='Nova Senha', widget=forms.PasswordInput, required=False)
    password_confirmation = forms.CharField(label='Confirmar Nova Senha', widget=forms.PasswordInput, required=False)

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        password_confirmation = cleaned_data.get('password_confirmation')

        if password and password_confirmation and password != password_confirmation:
            self.add_error('password_confirmation', 'As senhas não coincidem.')

        return cleaned_data