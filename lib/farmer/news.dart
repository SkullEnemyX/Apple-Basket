import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    List img = ["http://arditor.com/wp-content/uploads/2017/10/apples.jpg","https://cdn.britannica.com/s:300x300/60/5760-004-FDD0E2AB.jpg","http://upload.evocdn.co.uk/fruitnet/uploads/asset_image/2_1205998_e.jpg","https://i.ytimg.com/vi/P199zSqytiQ/maxresdefault.jpg"];
    List news = ["A bumper crop in the apple capital of India—Himachal and thus prices are more likely to rise in those particular region","They're wonderfully shiny and come in delightful shades of red, green and yellow -- but apples top the contaminated by pesticides list says a new report","Apples gained the top spot this year after pesticides were found on 98 per cent of the more than 700 samples tested.","However, one food sciences professor cautions that a natural or organic label on produce doesn't automatically make it safe, edmonton.ctv.ca reports."];
    List names = ["Daksh Chauhan","Vineet Kishore","Saurabh Sawant","Abhiraj Chaudhary"];
    List profile = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtS_UZyZipG_7MVyys08MCZdTFTfJG6GeRLMm4BKe59uzqybz9","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTwvWTtr9eV4t76QZM0f75dLhQdTYEe26SmKAopKWKlHwY8Q-CHA","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6vmF8zftYqafv5Zb3RhHjwV8RxB06VnTO7gAvvMeeqLQAJl2VmA","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaloW8rERQz9w416J7RpXykUeCN6QAmY8qNu0GyzQ-k_0eFX_r"];
    return StreamBuilder(
      stream: Firestore.instance.collection('News').snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        var items = snapshot.data?.documents ?? [];
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 12.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                  items[index]['userpic']),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index]['name'],
                                style: TextStyle(
                                    fontSize: 16.5, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                items[index]['location'],
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
          },
        );
      }
    );
  }
}
