from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.contrib.auth import logout

from django.contrib.auth.mixins import LoginRequiredMixin #usado para verificar se está logado quando usando
#classes como views

from apps.account.forms import CustomUserCreationForm, EmailAuthenticationForm

from .models import User, Endereco

from django.views.generic import ListView, DetailView,UpdateView

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

def LogoutView(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect(reverse_lazy('account:login'))
    return HttpResponseRedirect(reverse_lazy('core:index'))

class AddressListView(LoginRequiredMixin,ListView):
    model = Endereco
    template_name = 'account/address_list.html'  # substitua por seu template
    context_object_name = 'endereco_list'

    def get_queryset(self):
        return self.request.user.addresses.all()

'''class AddressDetailViewAndEdit(LoginRequiredMixin,UpdateView):
    model = Endereco
    template_name = 'account/address_detail.html'
    fields = ['cep', 'uf', 'bairro', 'endereco', 'cidade', 'numero', 'complemento']

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['is_edit'] = True  # Set a flag to indicate edit mode
        return context

    def get_success_url(self):
        return HttpResponseRedirect(reverse_lazy('account:address_list'))'''

from django.utils.http import quote

class AddressDetailViewAndEdit(LoginRequiredMixin, UpdateView):
    model = Endereco
    template_name = 'account/address_detail.html'
    fields = ['cep', 'uf', 'bairro', 'endereco', 'cidade', 'numero', 'complemento']

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['is_edit'] = True  # Set a flag to indicate edit mode
        return context

    def form_valid(self, form):
        endereco = form.save(commit=False)
        endereco.user = self.request.user  # Associate the endereco with the current user
        endereco.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_success_url(self):
        return reverse_lazy('account:address_list')


class AddressCreateView(LoginRequiredMixin, CreateView):
    model = Endereco
    template_name = 'account/address_create.html'
    fields = ['cep', 'uf', 'bairro', 'endereco', 'cidade', 'numero', 'complemento']

    def form_valid(self, form):
        endereco = form.save(commit=False)
        endereco.user = self.request.user
        endereco.save()
        self.request.user.addresses.add(endereco)
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('account:address_list')