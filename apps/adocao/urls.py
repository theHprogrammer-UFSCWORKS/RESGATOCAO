from django.urls import path

from . import views

app_name = 'adocao'

urlpatterns = [
    path('animal/', views.AnimalListView.as_view(), name='animal_list'),
    path('animal/<int:pk>/', views.AnimalDetailView.as_view(), name='animal_detail'),
]
