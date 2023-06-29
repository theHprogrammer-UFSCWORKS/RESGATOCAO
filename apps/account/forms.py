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

