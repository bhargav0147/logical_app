import 'package:flutter/material.dart';
import 'package:logical_app/Class/addScreen.dart';
import 'package:logical_app/Class/dashScreen.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => DashScreen(),
      'add' : (context) => AddScreen()
    },
  ));
}
