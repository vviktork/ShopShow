#!/usr/bin/env python


from django.urls import path
from .views import *


urlpatterns = [
    path('', ShoppingView.as_view()),
    path('', ProfileView.as_view()),
    path('', PannierView.as_view()),
]