// To parse this JSON data, do
//
//     final buyBills = buyBillsFromJson(jsonString);

import 'dart:convert';

BuyBills buyBillsFromJson(String str) => BuyBills.fromJson(json.decode(str));

String buyBillsToJson(BuyBills data) => json.encode(data.toJson());

class BuyBills {
  BuyBills({
    required this.bills,
  });

  List<Bill1> bills;

  factory BuyBills.fromJson(Map<String, dynamic> json) => BuyBills(
    bills: List<Bill1>.from(json["bills"].map((x) => Bill1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bills": List<dynamic>.from(bills.map((x) => x.toJson())),
  };
}

class Bill1 {
  Bill1({
    required this.id,
    required this.date,
    required this.totalBuyPrice,
    required this.distributor,
  });

  int id;
  DateTime date;
  int totalBuyPrice;
  String distributor;

  factory Bill1.fromJson(Map<String, dynamic> json) => Bill1(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    totalBuyPrice: json["total_buy_price"],
    distributor: json["distributor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "total_buy_price": totalBuyPrice,
    "distributor": distributor,
  };
}
