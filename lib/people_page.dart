import 'package:flutter/material.dart';
import 'package:folklist/models/person.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key key, this.people, this.updatePeople, this.icon, this.message}) : super(key: key);

  final List<Person> people;
  final Function updatePeople;
  final Icon icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return  people.isEmpty ? new Center(
      child: Text(message ?? 'No data'),
    ) : new ListView(
      children: 
        people.map((el) => new Container(
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child: new Container(
                    child: new Column(children: <Widget>[
                      ListTile(
                        title: Text("${el.name} ${el.lastName}"),
                        subtitle: Text("${el.dni}"),
                        trailing: IconButton(
                          icon: icon,
                          onPressed: () {
                            print(el.attended);
                            updatePeople(
                              el.idPerson.toString(),
                              el.attended
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
        )
      ).toList()
    );
  }
}
