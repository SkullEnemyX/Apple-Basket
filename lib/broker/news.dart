import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Newsdata {
  String displayName;
  String location;
  String userpic;
  String news;
  String photoid;

  Newsdata(
      {this.displayName, this.location, this.news, this.photoid, this.userpic});
}

class NewsPage extends StatefulWidget {
  final String name;
  final String userpic;
  NewsPage({this.name,this.userpic});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final formKey = new GlobalKey<FormState>();
  Newsdata newsdata = Newsdata();
  String url;
  int status = 0;
  int newspublished =0;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      uploadpicture();
      //   //textcontrol();
    }
  }

  publishArticle() async{
    final DocumentReference documentReference =
        Firestore.instance.document("News/${DateTime.now().millisecondsSinceEpoch.toString()}");
    if(newsdata.news!=null)
    {
      try{
        Map<String, dynamic> userinfo = <String, dynamic>{
          "name": "${newsdata.displayName}",
          "photoid": "$url",
          "userpic": "${newsdata.userpic}",
          "news": "${newsdata.news}",
          "location": "${newsdata.location}"
        };
        documentReference.setData(userinfo).whenComplete(() {
          print("Document Added");
          newspublished = 1;
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

  uploadpicture() async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("News/${DateTime.now().millisecondsSinceEpoch.toString()}");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);

    // Waits till the file is uploaded then stores the download url
    var location = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
     status = uploadTask.isSuccessful==true?1:0; 
    });
    url = location.toString();
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
                              maxLength: 200,
                              decoration: InputDecoration(labelText: "News"),
                              validator: (val) =>
                                  val.isEmpty || val.substring(0) == null
                                      ? 'News field is empty'
                                      : null,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => newsdata.news = val,
                            ),
                            new TextFormField(
                              maxLines: 1,
                              style: TextStyle(fontSize: 18.0),
                              autofocus: true,
                              autovalidate: true,
                              decoration: InputDecoration(labelText: "Location",labelStyle: TextStyle(fontSize: 18.0)),
                              validator: (val) =>
                                  val.isEmpty || val.substring(0) == null
                                      ? 'Location field is empty'
                                      : null,
                              keyboardType: TextInputType.text,
                              onSaved: (val) => newsdata.location = val,
                            ),
                          ])))),
          SizedBox(
            height: 30.0,
          ),
          Center(child: Text(status==0?"Uploading Picture":"Picture Uploaded",
          style: TextStyle(fontSize: 20.0),),),
          SizedBox(
            height: 30.0,
          ),
          url!=null?Container(
                margin: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: 180.0,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ):Container(),
          SizedBox(
            height: 30.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                 status = 0; 
                });
                _submit();
                newsdata.photoid =url;
              },
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child: Text("Upload Picture",
                        style: TextStyle(
                            color: Colors.redAccent, fontSize: 22.0))),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            InkWell(
              onTap: () {
                newsdata.displayName =widget.name;
                newsdata.userpic = "https://waysideschools.org/wp-content/uploads/2018/06/person-icon.png";
                publishArticle();
              },
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.redAccent)),
                child: Center(
                    child: Text(
                  "Publish",
                  style: TextStyle(color: Colors.redAccent, fontSize: 22.0),
                )),
              ),
            )
          ]),
          SizedBox(
            height: 35.0,
          ),
          newspublished==1?
          Center(
            child: Text("News Published",style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
          ):Container()
        ],
      ),
    ));
  }
}
