import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view/Screens/RequestsScreen.dart';
import 'package:flutter_view/models/AddCommunity.dart';
import 'package:flutter_view/models/AddHousehold.dart';
import 'package:flutter_view/models/addActivity.dart';

import 'Login&Signup.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),backgroundColor: Colors.redAccent),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              child: RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((onValue){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen() ));

                  });
                },
                child: const Text('Sign out', style: TextStyle(fontSize: 20)),
              ),



            ),
            SizedBox(height: 20,),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UploadStatus() ));

                },
                child: const Text('Add Activity', style: TextStyle(fontSize: 20,color: Colors.orange)),
              ),



            ),
            SizedBox(height: 20,),

            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UploadHousehold() ));

                },
                child: const Text('Add Households', style: TextStyle(fontSize: 20,color: Colors.green)),
              ),



            ),
            SizedBox(height: 20,),

            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UploadCommunity() ));

                },
                child: const Text('Add Communitys', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
              ),



            ),
            SizedBox(height: 20,),

            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RequestsScreen() ));

                },
                child: const Text('See the Requests', style: TextStyle(fontSize: 20,color: Colors.redAccent)),
              ),



            ),
          ],
        ),
      ),
    );
  }
}

