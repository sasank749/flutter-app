import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  get customerName => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Requests for Demo"),
      backgroundColor: Colors.orange,),
      body: StreamBuilder(

          stream: Firestore.instance.collection("MyCustomers").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.data.documents.length == 0) {
              return Text("no data");
            }
            return ListView.builder(itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,

                    child: Card(

                      child: ListTile(
                        leading: Text(
                            snapshot.data.documents[index].data["customerName"]),
                        title: Text(
                            snapshot.data.documents[index].data["cityName"]),
                        subtitle: Text(
                            snapshot.data.documents[index].data["communityName"]),
                      // trailing: InkWell(child: Icon(Icons.delete),onTap: (){deleteRequest();},),
                       //  trailing: InkWell(onTap: (){} child: Icon(Icons.delete),),
                      ),
                    ),
                  );
                });
          }
      ),
    );
  }
  deleteRequest(){
    print("deleted");
    DocumentReference documentReference=Firestore.instance.collection("MyCustomers").document(customerName);
    documentReference.delete().whenComplete((){
      print("$customerName deleted");
    });

  }
}