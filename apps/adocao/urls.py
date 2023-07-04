from django.urls import path

from . import views

app_name = 'adocao'

urlpatterns = [
    path('animal/', views.AnimalListView.as_view(), name='animal_list'),
    path('animal/<int:pk>/', views.AnimalDetailView.as_view(), name='animal_detail'),
    path('adocao/', views.AdocaoListView.as_view(), name='adocao_list'),
    path('adocao/<int:pk>/', views.AdocaoDetailView.as_view(), name='adocao_detail'),
    path('animal/<int:pk>/adocao/',
         views.AdocaoCreateView.as_view(), name='adocao_create'),

]
