import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Newstile extends StatefulWidget {
  final bool darkBackground;
  Newstile({this.darkBackground = false});
  @override
  _NewstileState createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('News').snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        var items = snapshot.data?.documents ?? [];
        Iterable inReverse = items.reversed;
        items = inReverse.toList();
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
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
                      items[index]['photoid'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.pinkAccent.shade100.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        items[index]['news'],
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  items[index]['name'],
                                  style: TextStyle(
                                      fontSize: 16.5, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  items[index]['location'],
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      color: Colors.grey.shade100),
                ],
              ),
            ));
          },
        );
      }
    );
  }
}
