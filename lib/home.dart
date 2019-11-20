import 'package:flutter/material.dart';
import 'package:folklist/addPerson.dart';
import 'package:folklist/people_page.dart';
import 'package:folklist/models/person.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Person> data = <Person>[];

   getJsonData() async {
    var response = await http.get('http://10.42.0.1:8080/apilist/people/');
    print(response.body);

    var attendees = <Person>[];
    
    json.decode(response.body).forEach((el) => attendees.add(new Person.fromJson(el)));

    setState(() {
      data = attendees;
    });
  }

  updatePerson(String id, bool attended) async {
    await http.patch('http://10.42.0.1:8080/apilist/people/$id/',
      headers: {
        "Content-Type": "application/json"
      },
      body: json.encode({"attended": !attended})
      );

    getJsonData();
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOLKLIST'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {getJsonData();},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPerson()),
          );
        },
      ),
      body: <Widget>[
        PeoplePage(
          people: data.where((el) => !el.attended).toList(),
          updatePeople: updatePerson,
          icon: Icon(Icons.check),
          message: 'No hay invitados',
        ),
        PeoplePage(
          people: data.where((el) => el.attended).toList(),
          updatePeople: updatePerson,
          icon: Icon(Icons.cancel),
          message: 'No hay ingresados al a previa',
        )
      ][_currentIndex],
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