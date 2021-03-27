import 'package:flutter/material.dart';
import 'package:infigon_app/screens/blogList.dart';
import 'package:infigon_app/screens/mainBlog.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/blogList',
    routes: {
      '/blogList':(context)=>BlogList(),
      '/mainBlog':(context)=>MainBlog()
    },
  ));
}

