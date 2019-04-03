import 'package:apple/farmer/dashboard.dart';
import 'package:apple/farmer/news.dart';
import 'package:apple/farmer/prices.dart';
import 'package:apple/farmer/profile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apple/common/feedback.dart';
class Farmer extends StatefulWidget {
  final String name;
  final String email;
  Farmer({this.name,this.email});
  @override
  _FarmerState createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  Future<List> getCurrencies() async {
  String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
  List currencies;
  @override
  void initState(){
    super.initState();
    fetch();
  }

  fetch() async{
    currencies = await getCurrencies();
  }
  //Declarations
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selected = 0;
  int currentPressed = 1;
  List<Widget> listItems = [];
  int selectedIndex = 0;
  int bodySection = 1;
  

  getScreen(int ind,int id){
    if(id==1){
    if(ind ==0)
    return Dashboard(
      name: widget.name,
      email: widget.email,
    );
    else if(ind ==1)
    return Newstile();
    else if(ind ==2)
    return Prices();
    else 
    return Container();
    }
    else if(id==2)
    {
      return Container();
    }
    else
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final titles = ['Dashboard','News','Prices','Connect'];
    final icons = [Icons.dashboard,Icons.library_books,Icons.trending_up,Icons.portrait];
    for(var i=0;i<4;i++)
    {
      listItems.add(
        InkWell(
          onTap: (){
            setState(() {
             listItems = [];
             selectedIndex = i;
             print(i);
             //Navigator.of(context).pop();
            });
          },
          child: Menubutton(
            name: titles[i],
            icon: icons[i],
            isSelected: i==selectedIndex,
            
          ),
        )
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.redAccent,
            size: 25.0,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          "Apple Basket",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
      drawer: Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("daksh.jpg"),
              foregroundColor: Colors.orange.shade100,
              backgroundColor: Colors.transparent,
            )), 
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${widget.name}",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Text(
            "${widget.email}",
            style: TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          Column(
            children: listItems,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: (){
              bodySection = 2;
              },
                      child: Menubutton(
              name: "Feedback",
              fontsize: 17.0,
            ),
          ),
          InkWell(
            onTap: (){
              bodySection = 2;
            },
                      child: Menubutton(
              name: "Settings",
              fontsize: 17.0,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                      Text(
                        "RATE APP",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.redAccent,
                        size: 30.0,
                      ),
                      Text(
                        "SHARE APP",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
      body:getScreen(selectedIndex,bodySection),
    );
  }
}
