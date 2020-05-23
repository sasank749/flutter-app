import 'package:flutter/material.dart';

import 'AddAddress.dart';
import 'MainScreen.dart';
import 'RequestForUse.dart';
import 'SettingsScreen.dart';

class Profilescreen extends StatefulWidget {
  @override
  _profilescreenState createState() => _profilescreenState();
}

class _profilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("MyGate"),
    backgroundColor: Colors.redAccent,
    centerTitle: true,
    actions: <Widget>[
    IconButton(icon: Icon(Icons.settings), onPressed: (){

    Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));


    })
    ],
    ),
    body: Column(
    children: <Widget>[
    Center(
    child: Container(
    margin: EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Form(
    child: Column(
    children: <Widget>[
    Icon(Icons.person_outline,size: 100,),

    const SizedBox(height: 10),
    Text('Sasank Reddy',style: TextStyle(
      color: Colors.blue,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),),
      SizedBox(height: 10),
    RaisedButton(

    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddAddressCity() ));

    },

    child: const Text('Add Flat/Villa', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
    ),
    const SizedBox(height: 40),
    RaisedButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddAddressCity() ));

    },
    child: const Text('Add WorkPlace', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
    ),
    const SizedBox(height: 40),
      RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => RequestDemo() ));

        },
        child: const Text('Request for Trial', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
      ),
    const SizedBox(height: 40),
    RaisedButton(
    onPressed: () {
   Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen() ));

    },
    child: const Text('Go to main Screen', style: TextStyle(fontSize: 20,color: Colors.black)),
    ),
    ],
    ),
    ),
    ),
    ),
    ]
    )
    );
  }
}
