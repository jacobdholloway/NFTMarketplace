from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import SignUpForm

def login(request):
    return render(request, 'marketPlace/login.html', {'page_title': 'NFT Marketplace'})

def homepage(request):
    return render(request, 'marketPlace/home_page.html', {'page_title': 'Account Home'})

def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('login'))  # Redirect to login page after signup
    else:
        form = SignUpForm()
    return render(request, 'signup.html', {'form': form})
