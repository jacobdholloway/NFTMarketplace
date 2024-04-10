from django.shortcuts import render

def home(request):
    return render(request, 'marketPlace/test.html', {'page_title': 'NFT Marketplace'})
