import 'package:flutter/cupertino.dart';

class Profil {
  final String id;
  final String first_name;
  final String last_name;
  final String phoneNumber;
  final String address;

  Profil(
      {@required this.id,
      @required this.first_name,
      this.last_name,
      @required this.phoneNumber,
      @required this.address});

  Profil.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        phoneNumber = json['phoneNumber'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'phoneNumber': phoneNumber,
        'address': address
      };
}
