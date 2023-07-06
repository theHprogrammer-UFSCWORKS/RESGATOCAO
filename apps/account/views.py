from django.contrib.auth import (authenticate, login, logout,
                                 update_session_auth_hash)
from django.contrib.auth.mixins import \
    LoginRequiredMixin  # usado para verificar se está logado quando usando
from django.contrib.auth.views import LoginView
from django.forms.models import model_to_dict
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.utils.http import quote
from django.views.generic import (DeleteView, DetailView, FormView, ListView,
                                  UpdateView, View)
from django.views.generic.edit import CreateView

from apps.account.forms import (AvatarUploadForm, CustomUserCreationForm,
                                CustomUserUpdateForm, EmailAuthenticationForm,
                                EmailPasswordUpdateForm)

from .models import Endereco, User

# classes como views


class SignUpView(CreateView):
    model = User
    form_class = CustomUserCreationForm
    template_name = 'account/signup.html'
    success_url = reverse_lazy('account:login')

    def form_invalid(self, form):
        print(form.errors)
        return super().form_invalid(form)


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


class AddressListView(LoginRequiredMixin, ListView):
    model = Endereco
    template_name = 'account/address_list.html'  # substitua por seu template
    context_object_name = 'endereco_list'

    def get_queryset(self):
        return self.request.user.addresses.all()


class AddressDetailViewAndEdit(LoginRequiredMixin, UpdateView):
    model = Endereco
    template_name = 'account/address_detail.html'
    fields = ['cep', 'uf', 'bairro', 'endereco',
              'cidade', 'numero', 'complemento']

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
    fields = ['cep', 'uf', 'bairro', 'endereco',
              'cidade', 'numero', 'complemento']

    def form_valid(self, form):
        endereco = form.save(commit=False)
        endereco.user = self.request.user
        endereco.save()
        self.request.user.addresses.add(endereco)
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('account:address_list')


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
        avatar_form = AvatarUploadForm(
            request.POST, request.FILES, instance=request.user)

        if form.is_valid() and avatar_form.is_valid():
            return self.form_valid(form, avatar_form)
        else:
            return self.form_invalid(form, avatar_form)

    def form_valid(self, form, avatar_form):
        avatar_form.save()  # Save the avatar form
        return super().form_valid(form)

    def form_invalid(self, form, avatar_form):
        return self.render_to_response(self.get_context_data(form=form, avatar_form=avatar_form))


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


class AddressSetMainView(LoginRequiredMixin, UpdateView):
    model = Endereco
    fields = ['is_principal']
    template_name = 'account/address_set_main.html'
    success_url = reverse_lazy('account:address_list')

    def form_valid(self, form):
        endereco = form.save(commit=False)
        endereco.is_principal = True
        endereco.save()

        # Set the other addresses as non-principal
        Endereco.objects.filter(user=self.request.user).exclude(
            pk=endereco.pk).update(is_principal=False)

        return super().form_valid(form)


class AddressSetMainView(LoginRequiredMixin, View):
    def get(self, request, pk):
        endereco = Endereco.objects.get(pk=pk)
        return render(request, 'account/address_set_main_confirm.html', {'endereco': endereco})


class AddressSetMainConfirmView(LoginRequiredMixin, DetailView):
    model = Endereco
    template_name = 'account/address_set_main_confirm.html'

    def post(self, request, pk):
        endereco = self.get_object()
        endereco.is_principal = True
        endereco.save()

        # Set the other addresses as non-principal
        Endereco.objects.filter(user=request.user).exclude(
            pk=pk).update(is_principal=False)

        return redirect('account:address_list')
