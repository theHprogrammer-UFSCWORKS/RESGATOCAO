from django.shortcuts import render
from django.views.generic import DetailView, ListView

from .models import Animal


class AnimalListView(ListView):
    model = Animal
    template_name = 'adocao/animal_list.html'  # substitua por seu template
    context_object_name = 'animals'
    paginate_by = 10  # altere para o número de animais que você quer por página


class AnimalDetailView(DetailView):
    model = Animal
    template_name = 'adocao/animal_detail.html'  # substitua por seu template
    context_object_name = 'animal'
