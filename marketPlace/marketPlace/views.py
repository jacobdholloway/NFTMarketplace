from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import UserProfile

def login(request):
    return render(request, 'marketPlace/login.html', {'page_title': 'NFT Marketplace'})

def homepage(request):
    return render(request, 'marketPlace/homepage.html', {'page_title': 'Account Home'})

def signup(request):
    if request.method == 'POST':
        form = UserProfile(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'marketPlace/login.html', {'page_title': 'NFT Marketplace'})  # Redirect to login page after signup
    else:
        form = UserProfile()
    return render(request, 'marketPlace/signup.html', {'form': form})