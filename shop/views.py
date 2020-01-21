#!/usr/bin/env python


from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import FormView
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import *
from .models import *


SHOP_LIST = []
PRICE_SUM = ''


class ShoppingView(LoginRequiredMixin, FormView):
    form_class = ShoppingForm
    template_name = 'shop/shopping.html'
    success_url = reverse_lazy('shopping')

    def post(self, request, *args, **kwargs):
        context = super(ShoppingView, self).post(self, request, *args, **kwargs)
        global SHOP_LIST, PRICE_SUM
        SHOP_LIST, PRICE_SUM = self.shopping_list(dict(request.POST))
        if SHOP_LIST == False:
            return HttpResponse(status=401)
        return context

    def get_context_data(self, **kwargs):
        context = super(ShoppingView, self).get_context_data()
        product_all = self.product_list()
        context['product_all'] = product_all
        return context

    def product_list(self):
        """Формируем список товаров"""
        product_all = []
        for i in list(Product.objects.all().values()):
            product_all += [(i['code_product'], i['name_product'], i['price_product'])]
        return product_all

    def shopping_list(self, data):
        """Проверяем данные по товарам и создаем корзину для пользователя"""
        shop_list = []
        price_sum = 0
        try:
            for i in list(data.values())[1]:
                prod = Product.objects.get(code_product=i)
                shop_list += [[prod.code_product, prod.name_product, prod.price_product]]
                price_sum += prod.price_product
        except:
            return False, None
        return shop_list, price_sum


class ProfileView(LoginRequiredMixin, View):

    def __init__(self):
        self.template_profile = 'shop/profile.html'

    def get(self, request):
        form = ProfileForm
        work = [''] + [i['line_business'] for i in list(Business.objects.all().values())]
        work_label = 'Область деятельности'
        return render(request,
                      self.template_profile,
                      {'form': form, 'work': work, 'workLabel': work_label, 'clean': 0}
                      )

    def post(self, request):
        form = ProfileForm(request.POST)
        if form.is_valid():
            form.save()
            return render_to_response(self.template_profile,
                                      {'clean': 1, 'text': 'Данные сохранены!'}
                                      )
        else:
            return render_to_response(self.template_profile,
                                      {'clean': 2, 'text': 'Анкета пользователя существует!'}
                                      )


class PannierView(LoginRequiredMixin, View):

    def get(self, request):
        global SHOP_LIST, PRICE_SUM
        return render(request, 'shop/basket.html', {'sum': PRICE_SUM, 'basket': SHOP_LIST})

