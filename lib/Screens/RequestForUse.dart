import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ProfileScreen.dart';
class RequestDemo extends StatefulWidget {
  @override
  _RequestDemoState createState() => _RequestDemoState();
}

class _RequestDemoState extends State<RequestDemo> {
  String customerName,cityName,communityName;
  getCustomerName(name){
    this.customerName=name;
  }
  getCityName(city){
    this.cityName=city;
  }
  getCommunityName(community){
    this.communityName=community;
  }
  sendData(){
    print("created");
    DocumentReference documentReference =Firestore.instance.collection("MyCustomers").document(customerName);
    Map<String, dynamic> students={
      "customerName": customerName,
      "cityName":cityName,
      "communityName":communityName

    };
    documentReference.setData(students).whenComplete((){
      print("$customerName created");

    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => Profilescreen()),
            (Route<dynamic> route) => false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Demo'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
          Padding(
          padding:  EdgeInsets.only(bottom:8.0),

                child: Center(
                  child: Text('Please Provide the following information',style: TextStyle(fontSize: 15,color: Colors.redAccent),
                  ),

                ),

              ),
                Padding(
                  padding:  EdgeInsets.only(bottom:8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,width: 2.0)
                        )
                    ),
                    onChanged: (String name) {
                      getCustomerName(name);
                    },
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom:8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "City",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,width: 2.0)
                        )
                    ),
                    onChanged: (String city) {
                      getCityName(city);
                    },
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom:8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Community",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,width: 2.0)
                        )
                    ),
                    onChanged: (String community) {
                      getCommunityName(community);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                RaisedButton(
                color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("Send Details"),
                  textColor: Colors.white,
                  onPressed: (){
                    sendData();

                  },
                ),
               ],
                ),

           ],
          ),


        ),
      ],
      ),
    );
  }
}
