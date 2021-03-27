import 'package:flutter/material.dart';
import'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class DataSearch extends SearchDelegate{

  dynamic emp;
  Widget widget;
  List<String> empList;
  List<String> empRegion;
  dynamic dataReturned;


  String camelCase(String text){
    if(text.length>0){
      return text[0].toUpperCase()+text.substring(1);
    }

    return "";
  }

  DataSearch({this.emp});

  @override
  List<Widget> buildActions(BuildContext context) {

    return[
      IconButton(
        icon: Icon(Icons.clear,),
        onPressed: (){
          query="";
        },
      ),
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,

      ),
      onPressed: (){
        close(context, null);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {



    List<String> Emp = emp['titles'].where((element) => element.trim().startsWith(camelCase(query))?true:false).toList();
    return Container(
        child:StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: Emp.length,
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
                              image: AssetImage('assets/'+emp['images'][index%2]),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(Emp[index],
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
                        'title':Emp[index],
                        'image':emp['images'][index%2],
                        'content':emp['content'][index%2]
                      });
                    },
                  )
              )
          ),

          staggeredTileBuilder: (int index) =>
          new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,

        )
    );
    throw UnimplementedError();
  }

}