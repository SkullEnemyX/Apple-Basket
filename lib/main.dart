import 'package:apple/Credentials/signin.dart';
import 'package:flutter/material.dart';

void main() => runApp(APPle());

class APPle extends StatefulWidget {
  @override
  _APPleState createState() => _APPleState();
}

class _APPleState extends State<APPle> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (BuildContext) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Apple",
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 253, 253, 253),
            body: Column(
              children: <Widget>[
                Expanded(child: Container(),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   Image.asset("assets/vector.png"),
                    SizedBox(
                      height: 50.0,
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
                          width: 30.0,
                        ),
                        Text(
                          "Easiest way to \nbe linked",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: ()=>
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                                  usertype: "Farmer",
                                ))),
                              
                              child: Container(
                                width: 150.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.redAccent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0)),
                                ),
                                child: Center(
                                    child: Text("Farmer",
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 25.0))),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                                  usertype: "Broker",
                                )));
                              },
                              child: Container(
                                width: 150.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    border: Border.all(color: Colors.redAccent)),
                                child: Center(
                                    child: Text(
                                  "Broker",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 25.0),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}