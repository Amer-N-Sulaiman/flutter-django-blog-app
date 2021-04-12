import 'package:flutter/material.dart';
import 'package:app/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'package:app/api/articleApi.dart';
import 'package:app/api/authApi.dart';
import 'package:app/pages/articles.dart';
import 'package:app/pages/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<ArticleProvider>(create: (context) => ArticleProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider())
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => Welcome(),
          '/articles': (context) => Articles(),
          // '/fullArticle': (context) => Details(),
        }
        
      ),
    );
  }
}
