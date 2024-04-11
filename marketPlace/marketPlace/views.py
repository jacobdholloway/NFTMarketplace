from django.shortcuts import render

def login(request):
    return render(request, 'marketPlace/login.html', {'page_title': 'NFT Marketplace'})

def homepage(request):
    return render(request, 'marketPlace/home_page.html', {'page_title': 'Account Home'})
