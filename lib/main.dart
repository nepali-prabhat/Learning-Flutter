import 'package:flutter/material.dart';
import './myHome.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
		title: 'Layout in flutter',
		theme: ThemeData(
		primarySwatch: Colors.blue
		),
		home: MyHome()
    );
  }
}
