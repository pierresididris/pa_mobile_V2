// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  });

  String? email;
  String? password;
  String? firstName;
  String? lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
  };
}
