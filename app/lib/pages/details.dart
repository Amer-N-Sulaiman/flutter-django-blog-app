import 'package:flutter/material.dart';
import 'package:app/models/article.dart';



class Details extends StatelessWidget {
  final Article article;
  Details({ @required this.article });


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Enjoy Reading - ${article.title}'),
      )
    );
  }
}