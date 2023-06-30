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
    path('enderecos/<int:pk>/delete/', views.AddressDeleteView.as_view(), name='address_delete'),

    path('detail/', views.UserDetailView.as_view(), name='user_detail'),
    path('detail/update', views.UserUpdateView.as_view(), name='user_update'),
    path('detail/email_password_update/', views.EmailPasswordUpdateView.as_view(), name='email_password_update')

] 
