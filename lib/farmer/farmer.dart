import 'package:flutter/material.dart';

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
            child: Text(
              "Vineet Kishore",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Text(
            "vineetkishore01@gmail.com",
            style: TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          Menubutton(
            name: "Dashboard",
            isPressed: true,
            icon: Icons.dashboard,
          ),
          Menubutton(
            name: "News",
            icon: Icons.library_books,
          ),
          Menubutton(
            name: "Prices",
            icon: Icons.trending_up,
          ),
          Menubutton(
            name: "Profile",
            icon: Icons.portrait,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          Menubutton(
            name: "Feedback",
            fontsize: 17.0,
          ),
          Menubutton(
            name: "Settings",
            fontsize: 17.0,
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
    );
  }
}

class Menubutton extends StatefulWidget {
  String name;
  double fontsize = 20.0;
  bool isPressed = false;
  IconData icon;
  Menubutton({this.fontsize, this.icon, this.isPressed, this.name});
  @override
  _MenubuttonState createState() => _MenubuttonState();
}

class _MenubuttonState extends State<Menubutton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        widget.name,
        style: TextStyle(
            fontWeight:
                widget.isPressed == true ? FontWeight.bold : FontWeight.normal,
            fontSize: widget.fontsize),
      ),
      leading: widget.icon != null ? Icon(widget.icon) : null,
    );
  }
}

class Newstile extends StatefulWidget {
  bool darkBackground = false;
  Newstile({this.darkBackground});
  @override
  _NewstileState createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> {

  Color thumbColor = Colors.grey.shade400;
  IconData likeDislike =Icons.thumb_up;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180.0,
                child: Image.network(
                  "http://arditor.com/wp-content/uploads/2017/10/apples.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.pinkAccent.shade100.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('"'+
                    "A bumper crop in the apple capital of India—Himachal and thus prices are more likely to rise in those particular region"+'"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              "https://qph.fs.quoracdn.net/main-raw-27012412-MHPqNoQYHhFIrvPiHOKFS4jGGRhxu5Cd.jpeg"),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Daksh Chauhan",
                            style: TextStyle(
                                fontSize: 16.5, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Himachal Pradesh",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(likeDislike,color: thumbColor,),
                          onPressed: () {
                            if(thumbColor==Colors.grey.shade400 && likeDislike==Icons.thumb_up)
                            {
                              setState(() {
                               likeDislike =Icons.thumb_up;
                               thumbColor = Colors.green; 
                              });
                            }
                            else if(thumbColor ==Colors.green && likeDislike==Icons.thumb_up)
                            {
                              setState(() {
                               likeDislike = Icons.thumb_down;
                               thumbColor = Colors.red; 
                              });
                            }
                            else if(thumbColor ==Colors.red && likeDislike == Icons.thumb_down)
                            {
                              setState(() {
                               thumbColor =Colors.green;
                              likeDislike = Icons.thumb_up; 
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  color: Colors.grey.shade100),
            ],
          ),
        ));
  }
}

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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, count) {
          return Newstile();
        },
      ),
    );
  }
}
