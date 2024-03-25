// To parse this JSON data, do
//
//     final buyBillDetails = buyBillDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BuyBillDetails buyBillDetailsFromJson(String str) => BuyBillDetails.fromJson(json.decode(str));

String buyBillDetailsToJson(BuyBillDetails data) => json.encode(data.toJson());

class BuyBillDetails {
  BuyBillDetails({
    required this.bill,
    required this.items,
  });

  Bill bill;
  List<Item> items;

  factory BuyBillDetails.fromJson(Map<String, dynamic> json) => BuyBillDetails(
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

class Item {
  Item({
    required this.id,
    required this.batchId,
    required this.med,
    required this.buyItemQuantity,
    required this.buyBillOrderId,
    required this.buyItemPrice,
  });

  int id;
  int batchId;
  String med;
  int buyItemQuantity;
  int buyBillOrderId;
  int buyItemPrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    batchId: json["batch_id"],
    med: json["med"],
    buyItemQuantity: json["buy_item_quantity"],
    buyBillOrderId: json["buy_bill_order_id"],
    buyItemPrice: json["buy_item_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "batch_id": batchId,
    "med": med,
    "buy_item_quantity": buyItemQuantity,
    "buy_bill_order_id": buyBillOrderId,
    "buy_item_price": buyItemPrice,
  };
}
