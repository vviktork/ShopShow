#!/usr/bin/env python


from django.contrib import admin
from django.contrib.sessions.models import Session
from django.contrib.auth.models import Group
from .models import *


admin.site.unregister(Group)


@admin.register(Session)
class SessionAdmin(admin.ModelAdmin):
    list_display = ('session_key', 'expire_date')
    list_filter = ('session_data',)
    fields = ('expire_date',)
    actions = None


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ('name_user', 'surname_user', 'old_user', 'work_user', 'mail_user', 'facebook_user')


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name_product', 'price_product', 'code_product', 'depiction_product')


@admin.register(Business)
class BusinessAdmin(admin.ModelAdmin):
    list_display = ('line_business',)