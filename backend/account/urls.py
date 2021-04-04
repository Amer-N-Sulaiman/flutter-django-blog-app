from django.urls import path

from .views import RegistrationView
from rest_framework.authtoken.views import obtain_auth_token

app_name = 'account'

urlpatterns = [
    path('signup/', RegistrationView.as_view(), name='signup'),
    path('login/', obtain_auth_token, name='login'),
]
