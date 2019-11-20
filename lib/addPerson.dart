import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' as JSON;

class AddPerson extends StatefulWidget {
  AddPerson({Key key}) : super(key: key);

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dniController = TextEditingController();

  addPerson() async {
    await http.post('http://10.42.0.1:8080/apilist/people/',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.jsonEncode({
        "name": nameController.text,
        "last_name": lastNameController.text,
        "dni": dniController.text,
        })
      );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              addPerson();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 24.0,
          right: 18.0,
          bottom: 18.0,
          left: 18.0,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: dniController,
                  decoration: InputDecoration(
                    labelText: 'DNI',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}