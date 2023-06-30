from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.contrib.auth import logout
from django.forms.models import model_to_dict

from django.contrib.auth.mixins import LoginRequiredMixin #usado para verificar se está logado quando usando
#classes como views

from apps.account.forms import CustomUserCreationForm, EmailAuthenticationForm,CustomUserUpdateForm,AvatarUploadForm,EmailPasswordUpdateForm

from .models import User, Endereco

from django.views.generic import ListView, DetailView,UpdateView, DeleteView

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
    
from django.shortcuts import redirect    

class AddressDeleteView(LoginRequiredMixin, DeleteView):
    model = Endereco
    success_url = reverse_lazy('account:address_list')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        if self.object.is_principal:
            # Prevent deletion of the main endereco
            return redirect('account:address_list')
        return super().delete(request, *args, **kwargs)

class UserDetailView(LoginRequiredMixin, DetailView):
    model = User
    template_name = 'account/user_detail.html'

    def get_object(self):
        return self.request.user

class UserUpdateView(LoginRequiredMixin, UpdateView):
    model = User
    form_class = CustomUserUpdateForm
    template_name = 'account/user_update.html'
    success_url = reverse_lazy('account:user_detail')

    def get_object(self, queryset=None):
        return self.request.user

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['avatar_form'] = AvatarUploadForm(instance=self.request.user)
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()  # Set the 'object' attribute
        form = self.get_form()
        avatar_form = AvatarUploadForm(request.POST, request.FILES, instance=request.user)

        if form.is_valid() and avatar_form.is_valid():
            return self.form_valid(form, avatar_form)
        else:
            return self.form_invalid(form, avatar_form)

    def form_valid(self, form, avatar_form):
        avatar_form.save()  # Save the avatar form
        return super().form_valid(form)

    def form_invalid(self, form, avatar_form):
        return self.render_to_response(self.get_context_data(form=form, avatar_form=avatar_form))

from django.views.generic import FormView

from django.contrib.auth import update_session_auth_hash 

class EmailPasswordUpdateView(FormView):
    form_class = EmailPasswordUpdateForm
    template_name = 'account/email_password_update.html'
    success_url = reverse_lazy('account:user_detail')

    def form_valid(self, form):
        user = self.request.user
        email = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password')

        if email:
            user.email = email
            user.save()

        if password:
            user.set_password(password)
            user.save()
            update_session_auth_hash(self.request, user)

        return super().form_valid(form)