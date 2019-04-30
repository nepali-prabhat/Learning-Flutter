// import 'package:flutter/material.dart';

// void main()=> runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title:'Todo App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title:"Stateful widget made."),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget{

//   MyHomePage({Key key, this.title}) : super(key:key);

//   final String title;

//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();  
//   }

// }
// class _MyHomePageState extends State<MyHomePage>{
//   int _sheeps = 0;
//   void _increaseSheeps(){
//     setState(() {
//      _sheeps += 1; 
//     });
//   }
//   void _decreaseSheeps(){
//     setState(() {
//      _sheeps -= 1; 
//     });
//   }
//   @override
//   Widget build(BuildContext build){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You bought this many sheeps:',
//             ),
//             Text(
//               '$_sheeps',
//               style: Theme.of(context).textTheme.display3 ,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){_increaseSheeps();},
//         tooltip: 'buy 1 more sheep',
//         child: Icon(Icons.add)
//       ),
//     );

//   }
// }