class Attendee {
  int idGuest;
  String name;
  String lastName;
  String dni;
  bool attended;

  Attendee({this.idGuest, this.name, this.lastName, this.dni, this.attended});

  Attendee.fromJson(Map<String, dynamic> json) {
    idGuest = json['id_guest'];
    name = json['name'];
    lastName = json['last_name'];
    dni = json['dni'];
    attended = json['attended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_guest'] = this.idGuest;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['dni'] = this.dni;
    data['attended'] = this.attended;
    return data;
  }
}