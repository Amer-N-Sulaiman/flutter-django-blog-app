from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.permissions import AllowAny, IsAdminUser
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework import status

from .models import Article
from .serializers import ArticleSerializer

from account.models import Account

# Create your views here.

class OpenList(APIView):
    authentication_classes = [TokenAuthentication, ]
    permission_classes = [AllowAny, ]

    def get(self, request):
        articles = Article.objects.all()
        serializer = ArticleSerializer(articles, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)


    def post(self, request):
        serializer = ArticleSerializer(data=request.data)
        account1 = Account.objects.get(pk=4)
        serializer.author = account1
        if serializer.is_valid():
            print(serializer.data)
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class AuthorList(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAdminUser]

    def get(self, request):
        articles = Article.objects.filter(author=request.user)
        serializer = ArticleSerializer(articles, many=True)

        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        
        serializer = ArticleSerializer(data=request.data)
        serializer.author = request.user
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
