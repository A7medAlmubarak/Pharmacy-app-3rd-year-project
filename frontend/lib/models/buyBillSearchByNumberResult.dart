// To parse this JSON data, do
//
//     final buyBillSearchResult = buyBillSearchResultFromJson(jsonString);

import 'dart:convert';

BuyBillSearchResult buyBillSearchResultFromJson(String str) => BuyBillSearchResult.fromJson(json.decode(str));

String buyBillSearchResultToJson(BuyBillSearchResult data) => json.encode(data.toJson());

class BuyBillSearchResult {
  BuyBillSearchResult({
    required this.bill,
  });

  Bill bill;

  factory BuyBillSearchResult.fromJson(Map<String, dynamic> json) => BuyBillSearchResult(
    bill: Bill.fromJson(json["bill"]),
  );

  Map<String, dynamic> toJson() => {
    "bill": bill.toJson(),
  };
}

class Bill {
  Bill({
    required this.id,
    required this.date,
    required this.totalBuyPrice,
    required this.distributor,
  });

  int id;
  DateTime date;
  int totalBuyPrice;
  String distributor;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
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
