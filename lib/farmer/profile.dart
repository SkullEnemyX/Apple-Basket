import 'package:flutter/material.dart';

class Menubutton extends StatefulWidget {
  final String name;
  final double fontsize;
  final bool isSelected;
  final IconData icon;
  Menubutton({this.fontsize, this.icon, this.isSelected = false, this.name});
  @override
  _MenubuttonState createState() => _MenubuttonState();
}

class _MenubuttonState extends State<Menubutton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      title: Text(
        widget.name,
        style: TextStyle(
            fontWeight:
                widget.isSelected == true ? FontWeight.bold : FontWeight.normal,
            fontSize: widget.fontsize),
      ),
      leading: widget.icon != null ? Icon(widget.icon) : null,
    );
  }
}

class Maindrawer extends StatefulWidget {
  final Function(String) onMenuItemSelected;
  Maindrawer(this.onMenuItemSelected);
  @override
  _MaindrawerState createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  int currentPressed = 1;
  List<Widget> listItems = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final titles = ['Dashboard','News','Prices','Profile'];
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
              "Daksh Chauhan",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Text(
            "dakshjaraik172@gmail.com",
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


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}