import 'package:flutter/material.dart';

class Farmer extends StatefulWidget {
  @override
  _FarmerState createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  //Declarations
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      drawer: Maindrawer(),
      body: Newstile(),
    );
  }
}


class Menubutton extends StatefulWidget {
  String name;
  double fontsize =20.0;
  bool isPressed =false;
  IconData icon;
  Menubutton({this.fontsize,this.icon,this.isPressed,this.name});
  @override
  _MenubuttonState createState() => _MenubuttonState();
}

class _MenubuttonState extends State<Menubutton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      title: Text(widget.name,style: TextStyle(
        fontWeight: widget.isPressed==true?FontWeight.bold:FontWeight.normal,
        fontSize: widget.fontsize
      ),),
      leading: widget.icon!=null?Icon(widget.icon):null,
    );
  }
}

class Newstile extends StatefulWidget {
  bool darkBackground =false;
  Newstile({this.darkBackground});
  @override
  _NewstileState createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.redAccent,
            spreadRadius: 7.0
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      height: 100.0,
      margin: EdgeInsets.all(5.0),
      child: Center(child: Text("Test"),),
    );
  }
}

class Maindrawer extends StatefulWidget {
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                backgroundImage: NetworkImage(
                    "https://avatars1.githubusercontent.com/u/36532034?s=460&v=4"),
                    foregroundColor: Colors.orange.shade100,
                backgroundColor: Colors.transparent,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Vineet Kishore",style: TextStyle(
                fontSize: 20.0
              ),),
            ),
            Text("vineetkishore01@gmail.com",style: TextStyle(
              fontSize: 15.0
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            Menubutton(name: "Dashboard",isPressed: true,icon: Icons.dashboard,),
            Menubutton(name: "News",icon: Icons.library_books,),
            Menubutton(name: "Prices",icon: Icons.trending_up,),
            Menubutton(name: "Profile",icon: Icons.portrait,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            Menubutton(name: "Feedback",fontsize: 17.0,),
            Menubutton(name: "Settings",fontsize: 17.0,),
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
                    onTap: (){},
                                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star,color: Colors.redAccent,size: 30.0,),
                        Text("RATE APP",style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  GestureDetector(
                    onTap: (){},
                                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.share,color: Colors.redAccent,size: 30.0,),
                        Text("SHARE APP",style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15.0
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}