import 'package:flutter/material.dart';
import 'package:folklist/models/attendee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Guest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GuestState();
  }
}

class _GuestState extends State<Guest> {
  List<Attendee> data = <Attendee>[];

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  getJsonData() async {
    var response = await http.get('http://10.42.0.1:8080/apilist/guest/');
    print(response.body);

    var attendees = <Attendee>[];
    
    json.decode(response.body).forEach((el) => attendees.add(new Attendee.fromJson(el)));

    setState(() {
      data = attendees;
    });
  }

  updateAttendee(String id, bool attended) async {
    await http.patch('http://10.42.0.1:8080/apilist/guest/$id/',
      headers: {
        "Content-Type": "application/json"
      },
      body: json.encode({"attended": !attended})
      );

    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child: new Container(
                    child: new Column(children: <Widget>[
                      ListTile(
                        title: Text("${data[index].name} ${data[index].lastName}"),
                        subtitle: Text("${data[index].dni}"),
                        trailing: IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            print(data[index].attended);
                            updateAttendee(
                              data[index].idGuest.toString(),
                              data[index].attended
                            );
                          },
                        ),
                      ),
                    ]),
//                    padding: const EdgeInsets.all(20.0),
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
