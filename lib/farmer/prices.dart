import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Prices extends StatefulWidget {
  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      color: Colors.white10,
      child: StreamBuilder(
        stream: Firestore.instance.collection('Prices').snapshots(),
        builder:(_, AsyncSnapshot<QuerySnapshot> snapshot)
        {
        var items = snapshot.data?.documents ?? [];
        Iterable inReverse = items.reversed;
        items = inReverse.toList();
          return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Price of Apples in ${items[index]['location']} is ${items[index]['price']}",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red.shade900
                ),),
              ),
              ],
            );
          });
        },

      ),
      
    );
  }
}