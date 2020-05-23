import 'package:flutter/material.dart';
import 'package:flutter_view/models/Activitys.dart';
import 'package:flutter_view/models/Community.dart';
import 'package:flutter_view/models/Household.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title:Center(child: new Text("MyFlat")),
            backgroundColor: Colors.red,


            actions: <Widget>[


            ],            bottom: TabBar(
            tabs: [
              Tab(text: "Activity"),
              Tab(text: "Household"),
              Tab(text: "community")

            ],
          ),
          ),
          body: TabBarView(
            children: [
              Activitys(),
              Household(),
              Community(),
            ],
          ),
        ),
      ),
    );

  }


}

