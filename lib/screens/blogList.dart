
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import'package:infigon_app/services/search.dart';


class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<String> images=['montain.jpg','amazin_river.jpg'];//list of images
  List<String> content=["A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock. A mountain differs from a plateau in having a limited summit area, and is larger than a hill, typically rising at least 300 metres (1000 feet) above the surrounding land.",'A river is a natural flowing watercourse, usually freshwater, flowing towards an ocean, sea, lake or another river. In some cases a river flows into the ground and becomes dry at the end of its course without reaching another body of water.'];//list of content
  List<String> titles=['Title 1', 'Title 2', 'Title 3', 'Title 4', 'Title 5', 'Title 6', 'Title 7', 'Title 8', 'Title 9', 'Title 10', 'Title 11', 'Title 12'];//list of titles
  Map<String,dynamic> send={};
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    send={'images':images,'content':content,'titles':titles};// this data is sent to search delegate to respond to search queries
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0.0,
        actions:<Widget> [
      IconButton(
      icon: Icon(
        Icons.search,
      ),
      onPressed: (){
        showSearch(context: context, delegate:DataSearch(emp:send));//on pressing the search icon the searching function is triggered by calling the Data Search Constructor
      },
      ),
      ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,// used to identify the current tapped icon
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
              icon:FaIcon(
                FontAwesomeIcons.home,

              ),
              backgroundColor: Colors.white,
              label:''
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                  FontAwesomeIcons.compass,

              ),
              backgroundColor: Colors.white,
              label:''
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                  FontAwesomeIcons.graduationCap,

              ),
              backgroundColor: Colors.white,
              label:''
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                  FontAwesomeIcons.bell,

              ),
              backgroundColor: Colors.white,
              label:''
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                  FontAwesomeIcons.questionCircle,

              ),
              backgroundColor: Colors.white,
              label:''
          )
        ],
        onTap: (index){
         setState(() {
           currentIndex=index;
         });

        },
      ),
      body: Container(
        child:StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) =>  Container(
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color:Colors.blueGrey,
                    blurRadius: 20.0
                  )
                ]
              ),
              child: Card(
                child:InkWell(
                  splashColor: Colors.blue,
                  child: Column(
                      children:<Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                            image: AssetImage('assets/'+images[index%2]),// modulus operator is used to use the 2 images over 12 grid boxes
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(titles[index],
                          style:TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                          )
                        ),
                        SizedBox(height: 10,),
                      ]
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/mainBlog',arguments: {
                      'title':titles[index],
                      'image':images[index%2],
                      'content':content[index%2]
                    });// used to send data to the next screen . In this case data pertaining to the specific blog is sent
                  },
                )
              )
          ),

          staggeredTileBuilder: (int index) =>
          new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,

        )
      ),
    );
  }
}



































































