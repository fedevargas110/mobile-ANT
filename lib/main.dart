import 'package:flutter/material.dart';
import 'package:folklist/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(brightness: Brightness.dark),
     title: 'FolkList',
     home: Home(),
   );
 }
}


