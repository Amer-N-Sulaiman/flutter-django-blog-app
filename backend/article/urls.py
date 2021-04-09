from django.urls import path

from . import views

app_name = 'article'

urlpatterns = [
    path('openlist/', views.OpenList.as_view()),
]
