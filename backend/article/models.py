from django.db import models
from django.contrib.auth import get_user_model
from django.conf import settings

from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
import os

# Create your models here.

def get_image_path(instance, filename):
        path = ""
        filename = filename.split('.')
        ext = filename[-1]
        format = str(instance.pk) + '.' + ext
        finalPath = path+format
        return finalPath

class Article(models.Model):
    title = models.CharField(max_length=100, unique=True) # I find it bad to have two articles with the exact same names
    body = models.TextField(max_length=10000)
    author = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, default=None)
    image = models.ImageField(upload_to=get_image_path, null=True, blank=True)
    date_added = models.DateTimeField(auto_now=True)

_UNSAVED_FILEFIELD = 'unsaved_filefield'

@receiver(pre_save, sender=Article)
def skip_saving_file(sender, instance, **kwargs):
    if not instance.pk and not hasattr(instance, _UNSAVED_FILEFIELD):
        setattr(instance, _UNSAVED_FILEFIELD, instance.image)
        instance.image = None

@receiver(post_save, sender=Article)
def save_file(sender, instance, created, **kwargs):
    if created and hasattr(instance, _UNSAVED_FILEFIELD):
        instance.image = getattr(instance, _UNSAVED_FILEFIELD)
        instance.save()        
        # delete it if you feel uncomfortable...
        # instance.__dict__.pop(_UNSAVED_FILEFIELD)
    