import 'dart:convert';

PersonsModel personsModelFromJson(String str) =>
    PersonsModel.fromJson(json.decode(str));

String personsModelToJson(PersonsModel data) => json.encode(data.toJson());

class PersonsModel {
  List<Person> persons;

  PersonsModel({
    required this.persons,
  });

  factory PersonsModel.fromJson(Map<String, dynamic> json) => PersonsModel(
        persons:
            List<Person>.from(json["items"].map((x) => Person.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(persons.map((x) => x.toJson())),
      };
}

class Person {
  String photo;
  String email;
  String mobile;
  String state;
  String active;

  Person({
    required this.photo,
    required this.email,
    required this.mobile,
    required this.state,
    required this.active,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        photo: json["photo"],
        email: json["email"],
        mobile: json["mobile"],
        state: json["state"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "email": email,
        "mobile": mobile,
        "state": state,
        "active": active,
      };
}
