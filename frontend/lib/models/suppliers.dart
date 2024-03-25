// To parse this JSON data, do
//
//     final suppliers = suppliersFromJson(jsonString);

import 'dart:convert';

Suppliers suppliersFromJson(String str) => Suppliers.fromJson(json.decode(str));

String suppliersToJson(Suppliers data) => json.encode(data.toJson());

class Suppliers {
  Suppliers({
    required this.distributor,
  });

  List<Distributor> distributor;

  factory Suppliers.fromJson(Map<String, dynamic> json) => Suppliers(
    distributor: List<Distributor>.from(json["Distributor"].map((x) => Distributor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Distributor": List<dynamic>.from(distributor.map((x) => x.toJson())),
  };
}

class Distributor {
  Distributor({
    required this.id,
    required this.name,
    required this.adminId,
    required this.admin,
    required this.phone,
    required this.email,
    required this.location,
  });

  int id;
  String name;
  int adminId;
  String admin;
  String phone;
  String email;
  String location;

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
    id: json["id"],
    name: json["name"],
    adminId: json["admin_id"],
    admin: json["admin"],
    phone: json["phone"],
    email: json["email"],
    location:  json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "admin_id": adminId,
    "admin": admin,
    "phone": phone,
    "email": email,
    "location":location,
  };
}
