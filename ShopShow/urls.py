#!/usr/bin/env python


from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from shop.views import *


urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page=reverse_lazy('login')), name='logout'),
    path('', ProfileView.as_view(), name='profile'),
    path('shop/', ShoppingView.as_view(), name='shopping'),
    path('pannier/', PannierView.as_view(), name='pannier'),
]
