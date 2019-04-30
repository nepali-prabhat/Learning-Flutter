import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget{
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
class MyHome extends StatelessWidget{

  Widget _buildButtonColumn(Color color, String text, IconData icon ){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color:color),
        Text('$text')
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    print('my home rendered');

    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Annapurna Basecamp',
                  style:TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Text('Pokhara, Nepal',
                  style: TextStyle(
                    color: Colors.grey[500],
                  )
                )
              ]
            ),
          ),
          FavouriteWidget(),
        ]
      )
    );
    
    Widget buildButton = Row( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(color,"Call",Icons.call),
            _buildButtonColumn(color,"Locate",Icons.location_on),
            _buildButtonColumn(color,"Share",Icons.share),
          ],
        );
    Widget textSection = Container(
        padding: EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        )
      );
    return Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu),title:Text('Layouts')),
        body: ListView(
          children: <Widget>[
            titleSection,
            buildButton,
            textSection
          ],
        ),
      );
  }
}
class FavouriteWidget extends StatefulWidget{
  @override
  _FavouriteWidgetState createState() {
    return _FavouriteWidgetState();
  }
}
class _FavouriteWidgetState extends State<FavouriteWidget>{
  int _starsCount = 40;
  bool _fav = false;
  void toggleFav(){
    setState((){
      if(_fav){
        _fav = !_fav;
        _starsCount--;
      }else{
        _fav = !_fav;
        _starsCount++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    print('favourite rendered');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        IconButton(icon:(_fav? Icon(Icons.star) : Icon(Icons.star_border)), color:Colors.red[300],onPressed: toggleFav),
        Text('$_starsCount')
      ]
    );
  }
}