import 'package:flutter/material.dart';
import 'guest_page.dart';
import 'attendees_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'FolkList',
     home: Home(),
   );
 }
}

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
        title: Text('FolkList'),
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


