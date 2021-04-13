import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:app/models/article.dart';

class ArticleProvider extends ChangeNotifier{

  List <Article> _articles = [];

  List <Article> get articles{
    return [..._articles];
  }


  
  
  ArticleProvider(){
    print('11111111111111111111');
    

    fetchArticles();
    
    print('22222222222222222');
  }


  fetchArticles() async{
    Article article1 = Article(id: 1, title: "Article 1 Title", body: "Ipsum non eiusmod eu nulla eu. Incididunt id exercitation aliqua cupidatat fugiat consequat dolore. Aute in labore aute in nulla do elit anim commodo laborum irure do. Dolore nostrud cupidatat Lorem labore aliqua nulla ex voluptate ex cillum. Anim duis exercitation enim cillum amet ipsum. Excepteur fugiat adipisicing est ea nulla ex reprehenderit ad magna laboris nostrud deserunt consectetur dolore.", img: '1.jpg');
    Article article2 = Article(id: 2, title: "Article 2 Title", body: "Ipsum non eiusmod eu nulla eu. Incididunt id exercitation aliqua cupidatat fugiat consequat dolore. Aute in labore aute in nulla do elit anim commodo laborum irure do. Dolore nostrud cupidatat Lorem labore aliqua nulla ex voluptate ex cillum. Anim duis exercitation enim cillum amet ipsum. Excepteur fugiat adipisicing est ea nulla ex reprehenderit ad magna laboris nostrud deserunt consectetur dolore.", img: '2.jpg');
    Article article3 = Article(id: 3, title: "Article 3 Title", body: "Ipsum non eiusmod eu nulla eu. Incididunt id exercitation aliqua cupidatat fugiat consequat dolore. Aute in labore aute in nulla do elit anim commodo laborum irure do. Dolore nostrud cupidatat Lorem labore aliqua nulla ex voluptate ex cillum. Anim duis exercitation enim cillum amet ipsum. Excepteur fugiat adipisicing est ea nulla ex reprehenderit ad magna laboris nostrud deserunt consectetur dolore.", img: '3.jpg');
    Article article4 = Article(id: 4, title: "Article 4 Title", body: "Ipsum non eiusmod eu nulla eu. Incididunt id exercitation aliqua cupidatat fugiat consequat dolore. Aute in labore aute in nulla do elit anim commodo laborum irure do. Dolore nostrud cupidatat Lorem labore aliqua nulla ex voluptate ex cillum. Anim duis exercitation enim cillum amet ipsum. Excepteur fugiat adipisicing est ea nulla ex reprehenderit ad magna laboris nostrud deserunt consectetur dolore.", img: '4.jpg');
    Article article5 = Article(id: 5, title: "Article 5 Title", body: "Ipsum non eiusmod eu nulla eu. Incididunt id exercitation aliqua cupidatat fugiat consequat dolore. Aute in labore aute in nulla do elit anim commodo laborum irure do. Dolore nostrud cupidatat Lorem labore aliqua nulla ex voluptate ex cillum. Anim duis exercitation enim cillum amet ipsum. Excepteur fugiat adipisicing est ea nulla ex reprehenderit ad magna laboris nostrud deserunt consectetur dolore.", img: '5.jpg');

    _articles.add(article1);
    _articles.add(article2);
    _articles.add(article3);
    _articles.add(article4);
    _articles.add(article5);

    notifyListeners();
  }
  

  

  
} 