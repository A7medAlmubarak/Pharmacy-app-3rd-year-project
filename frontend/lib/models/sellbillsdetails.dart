// To parse this JSON data, do
//
//     final sellBillDetails = sellBillDetailsFromJson(jsonString);

import 'dart:convert';

SellBillDetails sellBillDetailsFromJson(String str) => SellBillDetails.fromJson(json.decode(str));

String sellBillDetailsToJson(SellBillDetails data) => json.encode(data.toJson());

class SellBillDetails {
  SellBillDetails({
    required this.bill,
    required this.items,
    required this.returnStatus,
  });

  Bill bill;
  List<Item> items;
  int returnStatus;

  factory SellBillDetails.fromJson(Map<String, dynamic> json) => SellBillDetails(
    bill: Bill.fromJson(json["bill"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    returnStatus: json["return_status"],
  );

  Map<String, dynamic> toJson() => {
    "bill": bill.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "return_status": returnStatus,
  };
}

class Bill {
  Bill({
    required this.id,
    required this.date,
    required this.totalSellPrice,
    required this.user,
  });

  int id;
  DateTime date;
  int totalSellPrice;
  String user;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
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

class Item {
  Item({
    required this.batchId,
    required this.med,
    required this.sellItemQuantity,
    required this.sellItemPrice,
  });

  int batchId;
  String med;
  int sellItemQuantity;
  dynamic sellItemPrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    batchId: json["batch_id"],
    med: json["med"],
    sellItemQuantity: json["sell_item_quantity"],
    sellItemPrice: json["sell_item_price"],
  );

  Map<String, dynamic> toJson() => {
    "batch_id": batchId,
    "med": med,
    "sell_item_quantity": sellItemQuantity,
    "sell_item_price": sellItemPrice,
  };
}
