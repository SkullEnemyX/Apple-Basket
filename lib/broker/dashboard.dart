import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String email;
  Dashboard({this.email,this.name});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final gridItems = ["Manipulate Prices","Spread News","Meet brokers like you"];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.redAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text("Hello, ${widget.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text("Share real time news , prices and more as a broker!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        Positioned(
          bottom: 100.0,
                  child: Card(
            color: Colors.white,
            elevation: 5.0,
            child: Container(
              height: 300.0, 
              width: 350.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Things you can do includes",style: TextStyle(fontSize: 25.0),),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      borderOnForeground: true,
                      type: MaterialType.card,
                      color: Colors.grey.shade100,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5
                            )
                          ),
                        height: 100.0,
                        width: 100.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.library_books,color: Colors.blue,),
                            Text("Share News")
                          ],
                        ),
                      ),
                    ),
                    Material(
                      borderOnForeground: true,
                      type: MaterialType.card,
                      color: Colors.grey.shade100,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5
                            )
                          ),
                        height: 100.0,
                        width: 100.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.trending_up,color: Colors.green,),
                            Text("Manipulate Prices")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                        borderOnForeground: true,
                        type: MaterialType.card,
                        color: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.5
                            )
                          ),
                          height: 100.0,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.people_outline,color: Colors.purple,),
                              Text("Connect with brokers and farmers like you")
                            ],
                          ),
                        ),
                      ),
                )
                ],
              )
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Positioned(
          bottom: 20.0,
                  child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.star,color: Colors.yellow.shade700,),
                SizedBox(width: 10.0,),
                Text("Tap the menu and explore!",style: TextStyle(
                  fontSize: 20.0
                ),),
              ],
            ),
          ),
        ),
        
        ],
      ),
    );
  }
}