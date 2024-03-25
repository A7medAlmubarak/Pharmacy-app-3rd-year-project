// To parse this JSON data, do
//
//     final buyBills = buyBillsFromJson(jsonString);

import 'dart:convert';

NewBuyBill buyBillsFromJson(String str) =>
    NewBuyBill.fromJson(json.decode(str));

String buyBillsToJson(NewBuyBill data) => json.encode(data.toJson());

class NewBuyBill {
  NewBuyBill({
    required this.distributorId,
    required this.med,
  });

  String distributorId;
  List<Med> med;

  factory NewBuyBill.fromJson(Map<String, dynamic> json) => NewBuyBill(
        distributorId: json["distributor_id"],
        med: List<Med>.from(json["med"].map((x) => Med.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "distributor_id": distributorId,
        "med": List<dynamic>.from(med.map((x) => x.toJson())),
      };
}

class Med {
  Med({
    required this.quantity,
    required this.drugId,
    required this.buyItemPrice,
  });

  String quantity;

  int drugId;
  int buyItemPrice;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
        quantity: json["quantity"],
        drugId: json["drug_id"],
        buyItemPrice: json["buy_item_price"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "drug_id": drugId,
        "buy_item_price": buyItemPrice,
      };
}
