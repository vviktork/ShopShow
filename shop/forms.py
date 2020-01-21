#!/usr/bin/env python


from django import forms
from django.core.exceptions import ValidationError
from .models import Profile


class ShoppingForm (forms.Form):
    pass


class ProfileForm(forms.ModelForm):
    old_user = forms.IntegerField(label='Возраст', min_value=16, max_value=100)

    class Meta:
        model = Profile
        fields = ('name_user', 'surname_user', 'old_user', 'work_user', 'mail_user', 'facebook_user')

    def clean(self):
        cleaned_data = super(ProfileForm, self).clean()
        profile_all = Profile.objects.all().values()
        for i in list(profile_all):
            del i['id']
            if cleaned_data == i:
                raise ValidationError('Данные анкеты совпадает с существующей')
        return cleaned_data

    def save(self):
        new_profile = Profile.objects.create(**self.cleaned_data)
        return new_profile