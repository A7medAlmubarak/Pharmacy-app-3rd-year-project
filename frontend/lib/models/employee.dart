// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  int id;
  String name;
  String phone;
  String email;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
  };
}
