// To parse this JSON data, do
//
//     final sellBills = sellBillsFromJson(jsonString);

import 'dart:convert';

NewSellBill sellBillsFromJson(String str) => NewSellBill.fromJson(json.decode(str));

String sellBillsToJson(NewSellBill data) => json.encode(data.toJson());

class NewSellBill {
  NewSellBill({
    required this.med,
  });

  List<Med> med;

  factory NewSellBill.fromJson(Map<String, dynamic> json) => NewSellBill(
    med: List<Med>.from(json["med"].map((x) => Med.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "med": List<dynamic>.from(med.map((x) => x.toJson())),
  };
}

class Med {
  Med({
    required this.sellItemQuantity,
    required this.drugId,
  });

  String sellItemQuantity;
  int drugId;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
    sellItemQuantity: json["sell_item_quantity"],
    drugId: json["drug_id"],
  );

  Map<String, dynamic> toJson() => {
    "sell_item_quantity": sellItemQuantity,
    "drug_id": drugId,
  };
}
