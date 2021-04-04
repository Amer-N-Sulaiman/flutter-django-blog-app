import 'package:flutter/material.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Techs Blog')
      ),
      body:Column(
        children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top:30),
            child: Text(
              'Welcome To Our Blog',
              style: TextStyle(
                color: Colors.blue[900],
                letterSpacing: 5,
              )
            ),

          ),
        ),
        
        Container(
          width: 400,
          margin: EdgeInsets.only(top: 70),
          child: Card(
            child: Column(children: <Widget>[
              
              Container(
                width: 170,
                margin: EdgeInsets.only(top:40),
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Read Our Articles'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              
              ),

              Container(
                width: 100,
                margin: EdgeInsets.only(top:40),
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Login'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    
                  )
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:25, bottom:40),
                width: 100,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Signup'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  )
                ),
              ),
              
            ],),
          ),
        ),

        
      ],)
    );
  }
}