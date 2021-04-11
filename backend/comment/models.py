from django.db import models
from django.contrib.auth import get_user_model
from article.models import Article


# Create your models here.

class Comment(models.Model):
    author = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, default=None)
    article = models.ForeignKey(Article, on_delete=models.CASCADE, default=None)
    body = models.CharField(max_length=255)