#!/usr/bin/env python

from django.db import models
from django.core.validators import MinValueValidator


class Profile(models.Model):
    name_user = models.CharField(verbose_name='Имя', max_length=100)
    surname_user = models.CharField(verbose_name='Фамилия', max_length=100)
    old_user = models.IntegerField (verbose_name='Возраст')
    work_user = models.CharField(verbose_name='Область деятельности', max_length=100)
    mail_user = models.EmailField(verbose_name='E-mail', blank=True)
    facebook_user = models.CharField(verbose_name='Facebook', max_length=100, blank=True)

    def __str__(self):
        return self.surname_user

    class Meta:
        verbose_name = 'Анкетные данные'
        verbose_name_plural = 'Анкетные данные'
        ordering = ['surname_user']


class Product(models.Model):
    name_product = models.CharField(verbose_name='Наименование', max_length=200)
    price_product = models.IntegerField(verbose_name='Цена', validators=[MinValueValidator(1)])
    code_product = models.CharField(verbose_name='Код продукта', unique=True, max_length=20)
    depiction_product = models.CharField(verbose_name='Описание', max_length=1000, blank=True)

    def __str__(self):
        return self.name_product

    class Meta:
        verbose_name = 'Товар'
        verbose_name_plural = 'Товары'
        ordering = ['name_product']


class Business(models.Model):
    line_business = models.CharField(verbose_name='Область деятельности', max_length=200)

    def __str__(self):
        return self.line_business

    class Meta:
        verbose_name = 'Область деятельности'
        verbose_name_plural = 'Область деятельности'
        ordering = ['line_business']