from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from .models import UserProfile

class CustomUserCreationForm(UserCreationForm):
    address = forms.CharField(max_length=42, required=True, help_text="Enter your Ethereum address.")
    username = forms.CharField(label='Username', max_length=100)
    email = forms.EmailField(label='Email')
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
    
    class Meta:
        model = UserProfile
        fields = ('address','password1', 'password2',)

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.filter(username=username).exists():
            raise ValidationError("A user with that username already exists.")
        return username

    def clean_address(self):
        address = self.cleaned_data['address']
        if UserProfile.objects.filter(address=address).exists():
            raise ValidationError("This Ethereum address is already in use.")
        return address

    def save(self, commit=True):
        user = super().save(commit=False)
        user.username = self.cleaned_data['username']
        if commit:
            user.save()
            UserProfile.objects.create(user=user, address=self.cleaned_data['address'])
        return user
