import 'package:flutter/material.dart';

class Article{
  int id;
  String title;
  String body;
  String img;

  Article({this.id, this.title, this.body, this.img});

  factory Article.fromJson(Map <String, dynamic>json){
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      img: json['img'],
    );
  }

  dynamic toJson() => {'id': id, 'title':title, 'body':body, 'img':img};
}