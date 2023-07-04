from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from apps.account.forms import CustomUserCreationForm, EmailAuthenticationForm

from .models import User


class SignUpView(CreateView):
    model = User
    form_class = CustomUserCreationForm
    template_name = 'account/signup.html'
    success_url = reverse_lazy('account:login')


class EmailLoginView(LoginView):
    template_name = 'account/login.html'
    form_class = EmailAuthenticationForm  # use your custom form

    def form_valid(self, form):
        email = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')

        user = authenticate(self.request, username=email, password=password)

        if user is not None:
            login(self.request, user)
            return HttpResponseRedirect(reverse_lazy('core:index'))

        form.add_error(None, 'Email ou senha inválidos')
        return super().form_invalid(form)
