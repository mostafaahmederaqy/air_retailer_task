import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  Response response;

  UsersModel({
    required this.response,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    response: Response.fromJson(json["Response"]),
  );

  Map<String, dynamic> toJson() => {
    "Response": response.toJson(),
  };
}

class Response {
  List<User> users;

  Response({
    required this.users,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    users: List<User>.from(json["Users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  String name;
  String email;
  String image;
  String region;
  String mobile;
  String zone;
  bool isOnline;

  User({
    required this.name,
    required this.email,
    required this.image,
    required this.region,
    required this.mobile,
    required this.zone,
    required this.isOnline,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["Name"],
    email: json["Email"],
    image: json["image"],
    region: json["region"],
    mobile: json["mobile"],
    zone: json["zone"],
    isOnline: json["isOnline"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Email": email,
    "image": image,
    "region": region,
    "mobile": mobile,
    "zone": zone,
    "isOnline": isOnline,
  };
}