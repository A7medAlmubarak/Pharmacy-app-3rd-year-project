// To parse this JSON data, do
//
//     final returnBillNew = returnBillNewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReturnBillNew returnBillNewFromJson(String str) => ReturnBillNew.fromJson(json.decode(str));

String returnBillNewToJson(ReturnBillNew data) => json.encode(data.toJson());

class ReturnBillNew {
  ReturnBillNew({
    required this.med,
  });

  List<Med> med;

  factory ReturnBillNew.fromJson(Map<String, dynamic> json) => ReturnBillNew(
    med: List<Med>.from(json["med"].map((x) => Med.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "med": List<dynamic>.from(med.map((x) => x.toJson())),
  };
}

class Med {
  Med({
    required this.returnItemQuantity,
    required this.batchId,
    required this.sellBellOrderId,
  });

  String returnItemQuantity;
  int batchId;
  int sellBellOrderId;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
    returnItemQuantity: json["return_item_quantity"],
    batchId: json["batch_id"],
    sellBellOrderId: json["sell_bell_order_id"],
  );

  Map<String, dynamic> toJson() => {
    "return_item_quantity": returnItemQuantity,
    "batch_id": batchId,
    "sell_bell_order_id": sellBellOrderId,
  };
}
