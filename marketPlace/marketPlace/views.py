from django.shortcuts import render, redirect
from django.urls import reverse
from .models import UserProfile
from .models import User

def login(request):
    return render(request, 'marketPlace/login.html', {'page_title': 'NFT Marketplace'})

def homepage(request):
    return render(request, 'marketPlace/homepage.html', {'page_title': 'Account Home'})


def signup(request):
    if request.method == 'POST':
        form =  UserProfile(request.POST)
        if form.is_valid():
            # Create a new user instance from the form data.
            User.objects.create(
                username=form.cleaned_data['username'],
                email=form.cleaned_data['email'],
                password=form.cleaned_data['password']  # Again, do not use in production
            )
            return redirect('success_url')  # Redirect after POST
    else:
        form = UserProfile()  # An unbound form

    return render(request, 'marketPlace/signup.html', {'form': form})


def marketPlace(request):
    return render(request, 'marketPlace/marketplace.html', {'page_title': 'Marketplace'})

def sell(request):
    return render(request, 'marketPlace/sell.html', {'page_title': 'Sell NFT'})

def purchase(request):
    return render(request, 'marketPlace/purchase.html', {'page_title': 'Purchase NFT'})

def trade(request):
    return render(request, 'marketPlace/trade.html', {'page_title': 'Trade NFT'})