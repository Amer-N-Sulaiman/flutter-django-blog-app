from django.urls import path

from . import views

app_name = 'article'

urlpatterns = [
    path('openlist/', views.OpenList.as_view(), name='openlist'),
    path('authorlist/', views.AuthorList.as_view(), name='authorlist'),
]
