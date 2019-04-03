import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PriceData
{
  String location;
  String price;
  PriceData({this.location,this.price});
}

class Prices extends StatefulWidget {
  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  PriceData pricedata = new PriceData();
  final formKey = new GlobalKey<FormState>();
  int pricepublished = 0;

   void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      publishArticle();
      //   //textcontrol();
    }
  }


  publishArticle() async{
    final DocumentReference documentReference =
        Firestore.instance.document("Prices/${DateTime.now().millisecondsSinceEpoch.toString()}");
    if(pricedata.location!=null &&pricedata.price!=null)
    {
      try{
        Map<String, dynamic> userinfo = <String, dynamic>{
          "price": "${pricedata.price}",
          "location": "${pricedata.location}"
        };
        documentReference.setData(userinfo).whenComplete(() {
          print("Document Added");
          pricepublished = 1;
          setState(() {});
        }).catchError((e) => print(e)); 
      }catch(e){
        print('Error: $e');
      }
    }
    else{
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: <Widget>[
          Form(
              key: formKey,
              child: Theme(
                  data: ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.redAccent,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: new TextStyle(
                      fontSize: 22.0,
                    )),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new TextFormField(
                              maxLines: null,
                              style: TextStyle(fontSize: 18.0),
                              autofocus: true,
                              autovalidate: true,
                              decoration: InputDecoration(labelText: "Location"),
                              validator: (val) =>
                                  val.isEmpty || val.substring(0) == null
                                      ? 'Location field is empty'
                                      : null,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => pricedata.location = val,
                            ),
                            new TextFormField(
                              maxLines: 1,
                              style: TextStyle(fontSize: 18.0),
                              autofocus: true,
                              autovalidate: true,
                              decoration: InputDecoration(labelText: "Price",labelStyle: TextStyle(fontSize: 18.0)),
                              validator: (val) =>
                                  val.isEmpty || val.substring(0) == null
                                      ? 'Price field is empty'
                                      : null,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => pricedata.price = val,
                            ),
                          ])))),
          SizedBox(
            height: 30.0,
          ),
            InkWell(
              onTap: () {
                _submit();
              },
              child: Container(
                width: 100.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.redAccent)),
                child: Center(
                    child: Text(
                  "Publish Prices",
                  style: TextStyle(color: Colors.redAccent, fontSize: 22.0),
                )),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            pricepublished==1?
          Center(
            child: Text("Price Published",style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
          ):Container()
          ]),
      ));
  }
}