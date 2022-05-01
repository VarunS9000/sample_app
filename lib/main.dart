import 'package:flutter/material.dart';
import 'package:infigon_app/screens/blogList.dart';
import 'package:infigon_app/screens/mainBlog.dart';
import 'package:infigon_app/screens/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login':(context)=>LogIn(),
      '/blogList':(context)=>BlogList(),
      '/mainBlog':(context)=>MainBlog()
    },
  ));
}

