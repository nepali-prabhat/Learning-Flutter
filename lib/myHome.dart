//todo: Override the animation part once i learn the fluter equivalent implementation of ReactTransitionGroupPlus.

import 'package:flutter/material.dart';

/*
  this is the class for making buttom navigation items objects,
  associates then with corresponding childs, basic attributes, 
  and sets animation to each of navigation items and child.
*/

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
		Widget associatedChild,
    TickerProvider vsync,
  }) : _icon = icon,
       _color = color,
			 _associatedChild = associatedChild,
       _title = title,
       item = BottomNavigationBarItem(
         icon: icon,
         activeIcon: activeIcon,
         title: Text(title),
         backgroundColor: color,
       ),
       //This controls Animation, we can reverse, start, etc
       controller = AnimationController(
         duration: kThemeAnimationDuration,
         vsync: vsync,
       ){
          _animation = controller.drive(CurveTween(
            curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
          ));
        }

  final Widget _icon;
  final Color _color;
  final Widget _associatedChild;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  Animation<double> _animation;

  //fade transition to assiciated child of the navigation items
  FadeTransition transition(BuildContext context) {

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(
            begin: const Offset(0.0, 0.02), // Slightly down.
            end: Offset.zero,
          ),
        ),
        child: Center(
					child: _associatedChild,
				),
      ),
    );
  }

}

class MyHome extends StatefulWidget {
  
  static const String routeName = '/material/bottom_navigation';

  @override
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: const Icon(Icons.account_circle),
        title: 'Me',
        color: Colors.deepPurple,
				associatedChild: Text('My Home goes here',style:TextStyle(color: Colors.black)),
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.library_books),
        title: 'My Course',
        color: Colors.deepPurple,
				associatedChild: Text('My Courses go here',style:TextStyle(color: Colors.black)),
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(Icons.settings),
        activeIcon: const Icon(Icons.settings_applications),
        title: 'My Settings',
        color: Colors.indigo,
				associatedChild: Text('My Settings are here',style:TextStyle(color: Colors.black)),
        vsync: this,
      ),
    ];
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  Widget _buildTransitionsStack() {
    //this will have all the associated child of our navigation in a stack
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });
    return Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      //iconSize: 4.0,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );
    return Scaffold(
      body: Container(
        child: Center(
            child: _buildTransitionsStack(),
          ),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}