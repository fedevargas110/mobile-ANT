import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Guest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GuestState();
  }
}

class _GuestState extends State<Guest> {
  final String url = 'https://swapi.co/api/people';
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }
  
  Future<String> getJsonData() async{
    var response = await http.get('http://10.42.0.1:8080/apilist/guest/');
    print(response.body);

    setState(() {
      var convertDatatoToJson = jsonDecode(response.body);
      data = convertDatatoToJson;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index){
        return new Container(
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child: new Container(
                    child: new Text(data[index]['name']),
                    padding: const EdgeInsets.all(20.0),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
