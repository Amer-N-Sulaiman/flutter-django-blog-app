from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response

from .models import Article
from .serializers import ArticleSerializer

# Create your views here.

class OpenList(APIView):
    authentication_classes = [TokenAuthentication, ]
    permission_classes = [AllowAny]

    def get(self, request):
        articles = Article.objects.all()
        serializer = ArticleSerializer(articles, many=True)

        return Response(serializer.data)
