import 'package:flutter/material.dart';
import 'package:app/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'package:app/api/articleApi.dart';
import 'package:app/pages/articles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ArticleProvider(),
      child: MaterialApp(
        routes: {
          '/': (context) => Welcome(),
          '/articles': (context) => Articles(),
        }
        
      ),
    );
  }
}
