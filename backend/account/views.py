from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework import status
from .serializers import RegistrationSerializer, UserSerializer


from .models import Account


# Create your views here.

# View to get information about accounts for test
# class AccountsList(APIView):

#     authentication_classes = [TokenAuthentication]
#     permission_classes = [AllowAny]

#     def get(self, request):
#         accounts = Account.objects.all()
#         serializer = UserSerializer(accounts, many=True)

#         return Response(serializer.data, status=status.HTTP_200_OK)

class RegistrationView(APIView):
    authentication_classes = [TokenAuthentication, ]
    permission_classes = [AllowAny, ]

    def post(self, request):

        serializer = RegistrationSerializer(data=request.data)
        
        data = {}
        if serializer.is_valid():
            account = serializer.save()

            data['email'] = account.email
            data['username'] = account.username
            data['first_name'] = account.first_name
            data['last_name'] = account.last_name

            token = Token.objects.get(user=account).key

            data['token'] = token

        else:
            data = serializer.errors

        return Response(data)


    def get(self, request):
        users = Account.objects.all()
        serializer = UserSerializer(users, many=True)
        
        return Response(serializer.data)
