
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
class MainBlog extends StatefulWidget {
  @override
  _MainBlogState createState() => _MainBlogState();
}

class _MainBlogState extends State<MainBlog> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    data={};
    data= data.isEmpty ? ModalRoute.of(context).settings.arguments : data; // used to fetch data from previous screen
    return Scaffold(
      appBar:AppBar(
        title:Text('Main Blog'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        child : Card(

          child :Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),

                  child: Image(

                    image: AssetImage('assets/'+data['image']),
                  ),
                ),
              ),


              SizedBox(height: 10,),
              Center(
                child:Column(
                  children:[
                    Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight:FontWeight.bold,

                        )
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'By Varun Sreedhar',
                      style:TextStyle(
                        fontStyle: FontStyle.italic
                      )
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child:Padding(
                        padding:EdgeInsets.all(20),
                        child:Text(
                            data['content'],
                          style:TextStyle(
                            fontSize: 15,

                          )
                        )
                      ),

                    ),


                    LikeButton(

                      circleColor:
                      CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                      likeBuilder: (bool isLiked) {
                        return  FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color:isLiked ? Colors.red : Colors.grey

                        );
                      },
                      likeCount: 665,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "love",
                            style: TextStyle(color: color),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(color: color),
                          );
                        return result;
                      },
                    ),


                  ]
                )
              )

            ],
          )
        )
    )
    );
  }
}
