from django.views import View
from django.shortcuts import render


class IndexView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'core/index.html')
    
class ContatoView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'core/contato.html')
    
class AboutView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'core/about.html')