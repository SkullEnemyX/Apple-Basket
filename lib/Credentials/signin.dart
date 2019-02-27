import 'package:apple/Credentials/signup.dart';
import 'package:apple/farmer/farmer.dart';
import 'package:flutter/material.dart';

class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}

class Login extends StatefulWidget {
  String usertype = "Default";
  Login({this.usertype});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  UserData userData = new UserData();
  AnimationController _loginButtonController;
  Animation<double> buttonSqueezeAnimation;
  bool _isobscured = true;
  Color _eyeButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
            height: 30.0,
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
            height: 50.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width/14,
              ),
              Text(
                "Hello there! \nConnect With People",
                style: TextStyle(fontSize: 28.0),
              ),
            ],
          ),
          SizedBox(
            height: height/14,
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
                        height: height/35,
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
                      SizedBox(
                        height: height/7,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.redAccent,
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Farmer()));
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
                        height: height/8,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: width/14,
                          ),
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup())),
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
