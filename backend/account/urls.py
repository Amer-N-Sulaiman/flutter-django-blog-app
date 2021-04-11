from django.urls import path

from . import views
from rest_framework.authtoken.views import obtain_auth_token

app_name = 'account'

urlpatterns = [
    path('signup/', views.RegistrationView.as_view(), name='signup'),
    path('login/', obtain_auth_token, name='login'),
    # path('accountlist/', views.AccountsList.as_view(), name='accountlist')
]
