import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/api/articleApi.dart';
import 'package:app/pages/details.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> with TickerProviderStateMixin{

  
  
  @override
  Widget build(BuildContext context) {

    List <AnimationController> controllers=[];
    List <Animation> readMoreAnimations=[];

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
    print(articlesP.articles);
    for (int i=0; i<articlesP.articles.length; i++){
      print(3333333333);
      // The animation controllers
      AnimationController controller = AnimationController(
        duration: Duration(milliseconds: 100,),
        vsync: this,
      );

      Animation _readMoreAnimation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween(begin:50, end:400),
            weight: 1,
          ),
          
          
        ]
      ).animate(controller);

      controllers.add(controller);
      controllers[i].addListener(() {
        print(readMoreAnimations[i].value);
      });
      readMoreAnimations.add(_readMoreAnimation);

      String readMore = 'Read More!';
      content.add(
        AnimatedBuilder(
          animation: controllers[i],
          builder: (BuildContext context, _){
            return ListTile(
              title: Text(articlesP.articles[i].title),
              subtitle: Row(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text('${articlesP.articles[i].body.substring(0, (readMoreAnimations[i].value).round())} ...')
                ),
                TextButton(
                  child: Text('$readMore'),
                  onPressed: () {
                    
                    if (readMore == 'Read More!'){
                      controllers[i].forward();
                      readMore = 'Read Less!';
                    } else {
                      controllers[i].reverse();
                      readMore = 'Read More!';
                    }

                    
                  },
                  )
              ],),
                
              trailing: 
                  Container(
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
              

            );
          }

          
        )
      );
    }
    print(content);
    print(444444444444444);
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