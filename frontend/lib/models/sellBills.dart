// To parse this JSON data, do
//
//     final sellBills = sellBillsFromJson(jsonString);

import 'dart:convert';

SellBills sellBillsFromJson(String str) => SellBills.fromJson(json.decode(str));

String sellBillsToJson(SellBills data) => json.encode(data.toJson());

class SellBills {
  SellBills({
    required this.bills,
  });

  List<Bill2> bills;

  factory SellBills.fromJson(Map<String, dynamic> json) => SellBills(
    bills: List<Bill2>.from(json["bills"].map((x) => Bill2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bills": List<dynamic>.from(bills.map((x) => x.toJson())),
  };
}

class Bill2 {
  Bill2({
    required this.id,
    required this.date,
    required this.totalSellPrice,
    required this.user,
  });

  int id;
  DateTime date;
  int totalSellPrice;
  String user;

  factory Bill2.fromJson(Map<String, dynamic> json) => Bill2(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    totalSellPrice: json["total_sell_price"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "total_sell_price": totalSellPrice,
    "user": user,
  };
}
