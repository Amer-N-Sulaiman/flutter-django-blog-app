from django.shortcuts import render
from rest_framework.views import APIView
from article.models import Article
from .serializers import CommentSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication

# Create your views here.

class CommentsList(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get(self, request, id):
        
        article = Article.objects.get(pk=id)
        comments = article.comment_set.all()

        serializer = CommentSerializer(comments, many=True)

        return Response(serializer.data, status.HTTP_200_OK)

    def post(self, request, id):
        article = Article.objects.get(pk=id)
        author = request.user

        serializer = CommentSerializer(data=request.data)
        serializer.author = author
        serializer.article = article

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)