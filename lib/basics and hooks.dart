import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    print('[MyApp] build.');
    return MaterialApp(
      title: "widgets state and hooks",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: MyHomePage(title:"classic Todo list.")
    );
  }
}

class MyHomePage extends StatefulWidget{

  MyHomePage({Key key,this.title}):super(key:key){
    // print('[MyHomePage] constructor');
  }
  
  final String title;
  
  @override
  _MyHomePageState createState(){
    // print("[_MyHomePage] create state");
    return _MyHomePageState();
  }
  
}

class _MyHomePageState extends State<MyHomePage>{

  String _appTitle = '';

  @override
  void initState() {
    // print('[MyHomePageState] initState');
    _appTitle = widget.title;
    super.initState();
  }
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    // print("[_MyHomePage] build");
    return Scaffold(
      body: Container(
        height: 75,
        padding: const EdgeInsets.fromLTRB(8, 26, 8, 8) ,
        decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: "open menu button",
              onPressed: (){}
            ),
            Expanded(
              child: Text('$_appTitle'),
            ),
            IconButton(
              icon:Icon(Icons.search),
              tooltip: "search",
              onPressed: (){},
            )
          ]
        )
      )
    );
  }
}