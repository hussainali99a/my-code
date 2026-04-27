from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('shorten/', views.shorten_url, name='shorten'),
    path('check-alias/', views.check_alias, name='check_alias'),
    path('<str:short_code>/', views.redirect_url, name='redirect'),
]