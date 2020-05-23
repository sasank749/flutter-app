import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'Screens/Login&Signup.dart';


void main(){
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()



  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel=new Container(
      height: 400,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/lodha.png'),
          AssetImage('assets/images/lodha1.png'),
          AssetImage('assets/images/lodha2.png'),
          AssetImage('assets/images/lodha3.png'),
          AssetImage('assets/images/lodha4.png')



        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.green,
        indicatorBgPadding: 6.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('MyGate'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
        body: ListView(
          children: <Widget>[
        //image carousel begins
           image_carousel,
        SizedBox(height: 30),
        Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(

            textColor: Colors.white,
              color: Colors.red,
              child: Text("login"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen() ));

              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),

              RaisedButton(

                textColor: Colors.white,
                color: Colors.red,
                child: Text("Signup"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen() ));

                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        )



    ],
        )
        );

  }}