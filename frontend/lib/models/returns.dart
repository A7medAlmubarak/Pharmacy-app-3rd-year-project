// To parse this JSON data, do
//
//     final returnBills = returnBillsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReturnBills returnBillsFromJson(String str) => ReturnBills.fromJson(json.decode(str));

String returnBillsToJson(ReturnBills data) => json.encode(data.toJson());

class ReturnBills {
  ReturnBills({
    required this.bill,
    required this.items,
  });

  Bill bill;
  List<Item> items;

  factory ReturnBills.fromJson(Map<String, dynamic> json) => ReturnBills(
    bill: Bill.fromJson(json["bill"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bill": bill.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Bill {
  Bill({
    required this.id,
    required this.date,
    required this.updatedTotalPrice,
    required this.totalReturnPrice,
    required this.user,
  });

  int id;
  DateTime date;
  int updatedTotalPrice;
  int totalReturnPrice;
  String user;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    updatedTotalPrice: json["updated_total_price"],
    totalReturnPrice: json["total_return_price"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "updated_total_price": updatedTotalPrice,
    "total_return_price": totalReturnPrice,
    "user": user,
  };
}

class Item {
  Item({
    required this.med,
    required this.returnItemQuantity,
    required this.returnItemPrice,
  });

  String med;
  int returnItemQuantity;
  int returnItemPrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    med: json["med"],
    returnItemQuantity: json["return_item_quantity"],
    returnItemPrice: json["return_item_price"],
  );

  Map<String, dynamic> toJson() => {
    "med": med,
    "return_item_quantity": returnItemQuantity,
    "return_item_price": returnItemPrice,
  };
}
