import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ProfileScreen.dart';
//Registration page
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
          //AppBar Title
        title: Text("Sign Up",),

      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        margin: EdgeInsets.all(16),
        //Making the Widgets to locate in Center
        alignment: Alignment.center,
        //To display the widgets in List
        child: ListView(
          children: <Widget>[
            //Heading for SignUp
           Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(5.0),

                    child: new Text('Please Sign In',style: TextStyle(color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,),

                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Email TextField Widget
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (item) {
                      return item.contains("@")
                          ? null
                          : "Enter valid Email";
                    },
                    onChanged: (item) {
                      setState(() {
                        _email = item;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Password TextField Widget
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (item) {
                      return item.length > 6
                          ? null
                          : "Password must be 6 characters";
                    },
                    onChanged: (item) {
                      setState(() {
                        _password = item;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //SignUp Button Widget
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        signup();
                      },
                      child: Text(
                        "Register",
                      ),
                      textColor: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),
                  //Already Have an account
                  Text('Already have an account?',style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  ),

                  const SizedBox(height: 30),
                  //Navigate to LoginScreen
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen() ));

                    },
                    child: const Text(
                        'Login Here',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),



                ],
              )),
        ]
        ),
      ),
    );
  }
//SignUp backUp code
  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Register Success");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Profilescreen()),
                (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }}
  //Login Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Login"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[

         Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  //TextField for email
                  TextFormField(

                    keyboardType: TextInputType.emailAddress,
                    validator: (item) {
                      return item.contains("@")
                          ? null
                          : "Enter valid Email";
                    },
                    onChanged: (item) {
                      setState(() {
                        _email = item;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //TextField for password
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (item) {
                      return item.length > 6
                          ? null
                          : "Password must be 6 characters";
                    },
                    onChanged: (item) {
                      setState(() {
                        _password = item;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Login Button
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "Login",
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Navigate to SignUp Page
                  Text("Not Yet Registered ?",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,


                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_) => RegistrationScreen()));
                        },
                        child: Center(child: Text("Create a new Account",style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),),
                        )), alignment: Alignment.centerRight,)
                ],
              )),
        ]
        ),
      ),
    );
  }
//BackUp for Login
  void login() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Login Success");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Profilescreen()),
                (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }
}