import 'package:flutter/material.dart';

class Article{
  int id;
  String title;
  String body;
  String date_added;
  String image;

  Article({this.id, this.title, this.body, this.date_added, this.image});

  factory Article.fromJson(Map <String, dynamic>json){
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      date_added: json['date_added'],
      image: json['image'],
    );
  }

  dynamic toJson() => {'id': id, 'title':title, 'body':body, 'date_added': date_added, 'image':image};
}