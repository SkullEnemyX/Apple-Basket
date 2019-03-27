import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final namesList = ["Vineet Kishore","K. Vishnu Vamsi","Saurabh Sawant","Vaibhav Vyas","Kartikay Paul"];
  final phno = [7550172355,79789812381,7448367734,7448367704,7550170675];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: namesList.length,
        itemBuilder: (context,index)
        {
          return ListTile(
            onTap: () {},
            leading: Icon(Icons.people),
            title: new Text(namesList[index]),
          );
        },
      ),
      
    );
  }
}