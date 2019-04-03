import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:apple/Credentials/signup.dart';
import 'package:apple/broker/broker.dart';
import 'package:apple/farmer/farmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}

class Userauthentication {
  String message = "Account created successfully";
  Future<String> createUser(UserData userdata) async {
    FirebaseUser _auth =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userdata.email,
      password: userdata.password,
    );
    return "${_auth.uid}";
  }

  Future<String> verifyuser(UserData userdata) async {
    FirebaseUser _auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userdata.email, password: userdata.password);
    return "${_auth.uid}";
  }

  logout(UserData userdata) async {
    FirebaseAuth.instance.signOut();
  }
}

class Login extends StatefulWidget {
  final String usertype;
  Login({this.usertype = 'Default'});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  bool signinInitiated = false;
  UserData userData = new UserData();
  Animation<double> buttonSqueezeAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isobscured = true;
  Color _eyeButtonColor = Colors.grey;
  final Userauthentication userAuth = new Userauthentication();

  void _submit() {
    setState(() {
      signinInitiated = true;
    });
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      performlogin();
      //   //textcontrol();
    }
  }

  void performlogin() async {
    String _uid;
    List<String> error;
    final snackbar1 = new SnackBar(
      content: Text("Sign in successful"), //replace name with database name.
    );
    final DocumentReference documentReference =
        Firestore.instance.document("Users/${userData.email}");

    await documentReference.get().then((snapshot) {
      if (snapshot.exists) {
        userData.email = snapshot.data['email'];
        userData.displayName = snapshot.data['name'];
      }
    });
    try {
      setState(() {});
      _uid = await userAuth.verifyuser(userData);
      print(_uid);
      setState(() {
        signinInitiated = false;
      });
      if (_uid != null) {
        _scaffoldKey.currentState.showSnackBar(snackbar1);
        Timer(
            Duration(milliseconds: 400),
            () => widget.usertype == "Farmer"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Farmer(
                              name: userData.displayName,
                              email: userData.email,
                            )))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Broker(
                              name: userData.displayName,
                              email: userData.email,
                            ))));
      } else {
        final snackbar2 = new SnackBar(
          content: Text("Sign in failed!"),
        );
        _scaffoldKey.currentState.showSnackBar(snackbar2);
      }
    } catch (e) {
      error = e.toString().split("(");
      error = error[1].toString().split(",");
      final snackbar2 = new SnackBar(
        content: Text("Sign in failed!\nReason: ${error[1].toString()}"),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar2);
      print(e);
    }
    setState(() {
      signinInitiated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25.0,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: height / 14,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Text(
              "Apple Basket",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontFamily: "NotoSans-Bold",
                  fontSize: 28.0),
            ),
          ]),
          SizedBox(
            height: height / 12,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width / 14,
              ),
              Text(
                "Hello there! \nConnect With People",
                style: TextStyle(fontSize: 28.0),
              ),
            ],
          ),
          SizedBox(
            height: height / 14,
          ),
          Form(
            key: formKey,
            child: Theme(
              data: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.redAccent,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: new TextStyle(
                  fontSize: 18.0,
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new TextFormField(
                        decoration: InputDecoration(labelText: "Email Address"),
                        validator: (val) =>
                            val.isEmpty || val.substring(0) == null
                                ? 'Email field is empty'
                                : null,
                        keyboardType: TextInputType.text,
                        onSaved: (val) => userData.email = val,
                      ),
                      SizedBox(
                        height: height / 35,
                      ),
                      new TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (_isobscured) {
                                setState(() {
                                  _isobscured = false;
                                  _eyeButtonColor = Colors.redAccent;
                                });
                              } else {
                                setState(() {
                                  _isobscured = true;
                                  _eyeButtonColor = Colors.grey;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _eyeButtonColor,
                            ),
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty || val.substring(0) == null
                                ? 'Password field is empty'
                                : null,
                        keyboardType: TextInputType.text,
                        onSaved: (val) => userData.password = val,
                        obscureText: _isobscured,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      signinInitiated
                          ? SpinKitRing(
                              color: Colors.redAccent,
                              lineWidth: 3.0,
                            )
                          : SizedBox(
                              height: 0.0,
                            ),
                      SizedBox(height: 30.0),
                      Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.redAccent,
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {
                            _submit();
                          },
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: width / 14,
                          ),
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Signup(usertype: widget.usertype))),
                            child: Text(
                              " Register",
                              style: TextStyle(color: Colors.grey.shade900),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Terms",
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
