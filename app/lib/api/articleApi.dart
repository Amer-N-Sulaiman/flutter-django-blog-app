import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:app/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleProvider extends ChangeNotifier{

  String base_url = '192.168.43.112:8000';

  List <Article> _articles = [];

  List <Article> get articles{
    return [..._articles];
  }


  
  
  ArticleProvider(){
    fetchArticles();
  }


  fetchArticles() async{
    final response = await http.get(Uri.http(base_url, 'article/openlist'));
    print(1);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      print(2);
      _articles = data.map<Article>((json) => Article.fromJson(json)).toList();

      notifyListeners();
    } else{
      print('error');
    }
    notifyListeners();
  }
  

  

  
} 