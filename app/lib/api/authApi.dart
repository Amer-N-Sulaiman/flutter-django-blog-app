import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';


class AuthProvider extends ChangeNotifier{

  bool authStatus = false;

  String base_url = '192.168.1.9:8000';
  void login(String email, String password) async{
    Map data = {};
    data['username'] = email;
    data['password'] = password;

    final response = await http.post(Uri.http(base_url, 'authentication/login/'),
        headers: {"Content-Type": "application/json"}, body: json.encode(data));

    var token;
    if (response.statusCode == 200){
      token = json.decode(response.body)['token'];
      final userInfoResponse = await http.get(Uri.http(base_url, 'authentication/currentUserinfo/'), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Token $token',
      });
      if(response.statusCode == 200){
        var username = json.decode(userInfoResponse.body)['username'];
        await FlutterSession().set('email', email);
        await FlutterSession().set('username', username);
      }else{
        print('error2');
      }
      
    } else{
      print('error');
    }
    // await storage.write(key: 'AuthToken', value: token);
    authStatus = true;
    await FlutterSession().set('token', token);
  }

  
}