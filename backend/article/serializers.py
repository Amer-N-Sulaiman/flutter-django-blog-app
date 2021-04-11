from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import Article

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('__all__')

    def save(self):
        article = Article(
            title = self.validated_data['title'],
            body = self.validated_data['body'],
            author = self.author
        )

        article.save()

        return article
