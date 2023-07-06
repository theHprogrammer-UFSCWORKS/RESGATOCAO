from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import Http404
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse
from django.views import View
from django.views.generic import DetailView, ListView

from .models import Adocao, AdocaoSteps, Animal


class AdocaoCreateView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        animal = get_object_or_404(Animal, pk=kwargs['pk'])
        Adocao.objects.create(
            animal=animal,
            adotante=request.user,
            etapa=AdocaoSteps.REQUISICAO_REALIZADA
        )
        return redirect('adocao:adocao_list')


class AnimalListView(ListView):
    model = Animal
    template_name = 'adocao/animal_list.html'  # substitua por seu template
    context_object_name = 'animals'
    paginate_by = 3  # altere para o número de animais que você quer por página

    def get_queryset(self):
        return Animal.objects.all().order_by('-id')

class AnimalDetailView(DetailView):
    model = Animal
    context_object_name = 'animal'
    template_name = 'adocao/animal_detail.html'  # substitua por seu template

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.is_authenticated:
            context['has_principal_address'] = self.request.user.addresses.filter(
                is_principal=True).exists()
            context['user_has_requested'] = Adocao.objects.filter(
                adotante=self.request.user, animal=self.object).exists()
            context['adocao_em_andamento'] = Adocao.objects.filter(
                animal=self.object, etapa__in=[AdocaoSteps.REQUISICAO_REALIZADA, AdocaoSteps.ENTREVISTA_PRESNECIAL]).exists()
            context['adocao_rejeitada'] = Adocao.objects.filter(
                adotante=self.request.user, animal=self.object, etapa=AdocaoSteps.FINALIZADO_ADOCAO_REJEITADA).exists()
        return context




class AdocaoListView(LoginRequiredMixin, ListView):
    model = Adocao
    template_name = 'adocao/adocao_list.html'  # substitua por seu template
    context_object_name = 'adocoes'
    paginate_by = 10  # altere para o número de adoções que você quer por página

    def get_queryset(self):
        return Adocao.objects.filter(adotante=self.request.user)



class AdocaoDetailView(LoginRequiredMixin, DetailView):
    model = Adocao
    template_name = 'adocao/adocao_detail.html'  # substitua por seu template
    context_object_name = 'adocao'

    def get_object(self, queryset=None):
        obj = super().get_object(queryset=queryset)
        if not obj.adotante == self.request.user:
            raise Http404()
        return obj
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['status'] = self.object.etapa
        return context

