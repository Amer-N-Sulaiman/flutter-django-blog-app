from django.db import models
from django.contrib.auth import get_user_model

# Create your models here.

class Article(models.Model):
    title = models.CharField(max_length=100, unique=True) # I find it bad to have two articles with the exact same names
    body = models.CharField(max_length=10000)
    author = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    date_added = models.DateTimeField(auto_now=True)