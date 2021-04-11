from django.urls import path
from . import views

app_name = 'comment'

urlpatterns = [
    path('articlecommentslist/<int:id>/', views.CommentsList.as_view(), name='commentslist'),
]
