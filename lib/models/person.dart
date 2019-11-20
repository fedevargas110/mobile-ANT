class Person {
  int idPerson;
  String name;
  String lastName;
  String dni;
  bool attended;

  Person({this.idPerson, this.name, this.lastName, this.dni, this.attended});

  Person.fromJson(Map<String, dynamic> json) {
    idPerson = json['id_people'];
    name = json['name'];
    lastName = json['last_name'];
    dni = json['dni'];
    attended = json['attended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_people'] = this.idPerson;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['dni'] = this.dni;
    data['attended'] = this.attended;
    return data;
  }
}