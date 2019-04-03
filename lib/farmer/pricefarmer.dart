import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Price extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      color: Colors.white10,
      child: StreamBuilder(
        stream: Firestore.instance.collection('Prices').snapshots(),
        builder: (_,AsyncSnapshot<QuerySnapshot> snapshot){
          var items = snapshot.data?.documents ?? [];
          Iterable inReverse = items.reversed;
          items = inReverse.toList();
          return Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Today's Default Apple's Market Valuse"),
                    ),
                    Text("Rs. "+"${items[0]['price']}",style: TextStyle(
                      fontSize: 100.0,
                      color: Colors.red
                    ),),
                    ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context,index){

                      },
                    )
                      ],
                    ),
                  )
                ]
          );
        },
      ),
    );
  }
}

// return Container(
//       margin: const EdgeInsets.all(20.0),
//       color: Colors.white10,
//       child: StreamBuilder(
//         stream: Firestore.instance.collection('Prices').snapshots(),
//         builder:(_, AsyncSnapshot<QuerySnapshot> snapshot)
//         {
//         var items = snapshot.data?.documents ?? [];
//         Iterable inReverse = items.reversed;
//         items = inReverse.toList();
//           return ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context,index){
//             return Column(
//               children: <Widget>[
//               Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //   child: Text("Today's Default Apple's Market Value"),
                    // ),
//                     Text("Rs"+"${items[0]['price]}",style),

//                   ],
//                 ),
//               )
//               ],
//             );
//           });
//         },

//       ),
      
//     );