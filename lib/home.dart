import 'package:flutter/material.dart';
import 'package:folklist/attendees_page.dart';
import 'package:folklist/guest_page.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Guest(),
    Attendees()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOLKLIST'),
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        onTap: onTabTapped, 
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Guests'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check), 
              title: Text('Assists')
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}