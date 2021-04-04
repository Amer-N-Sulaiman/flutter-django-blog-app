import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/api/articleApi.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  
  @override
  Widget build(BuildContext context) {

    ArticleProvider articlesP = Provider.of<ArticleProvider>(context);

    List <Widget> content = [];

    content.add(
      Container(
        margin: EdgeInsets.only(top: 30, bottom: 25),
        child: Text(
          'Enjoy Our Articles',
          style: TextStyle(
            color: Colors.blue[900],
            letterSpacing: 5,
          ),
          textAlign: TextAlign.center,
        ),
        
      )
    );

    for (int i=0; i<articlesP.articles.length; i++){
      content.add(
        ListTile(
          title: Text(articlesP.articles[i].title),
          subtitle: Text('${articlesP.articles[i].body.substring(0, 40)} ...'),
          trailing: Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('images/${articlesP.articles[i].img}',
              fit: BoxFit.cover)
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]),
              color: Colors.white,
            ),
          ),

        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Techs Blog')
      ),
      body: ListView(
        children: content,
      )
    );
    
  }
}