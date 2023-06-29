from django.urls import path

from . import views

app_name = 'account'

urlpatterns = [
    path('signup/', views.SignUpView.as_view(), name='signup'),
    path('login/', views.EmailLoginView.as_view(), name='login'),
    path('logout/', views.LogoutView, name='logout'),
    path('enderecos/', views.AddressListView.as_view(), name='address_list'),
    path('enderecos/<int:pk>/', views.AddressDetailViewAndEdit.as_view(), name='address_detail'),
    path('enderecos/create/', views.AddressCreateView.as_view(), name='address_create'),
]
