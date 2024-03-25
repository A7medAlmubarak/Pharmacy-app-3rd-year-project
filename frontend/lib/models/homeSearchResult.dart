// To parse this JSON data, do
//
//     final homereasult = homereasultFromJson(jsonString);

import 'dart:convert';

Homereasult homereasultFromJson(String str) => Homereasult.fromJson(json.decode(str));

String homereasultToJson(Homereasult data) => json.encode(data.toJson());

class Homereasult {
  Homereasult({
    required this.meds,
  });

  List<Med> meds;

  factory Homereasult.fromJson(Map<String, dynamic> json) => Homereasult(
    meds: List<Med>.from(json["Meds"].map((x) => Med.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Meds": List<dynamic>.from(meds.map((x) => x.toJson())),
  };
}

class Med {
  Med({
    required this.id,
    required this.name,
    required this.storageQuantity,
    required this.sellPrice,
    required this.barcodeNumber,
  });

  int id;
  String name;
  int storageQuantity;
  int sellPrice;
  String barcodeNumber;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
    id: json["id"],
    name: json["name"],
    storageQuantity: json["storage_quantity"],
    sellPrice: json["sell_price"],
    barcodeNumber: json["barcode_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "storage_quantity": storageQuantity,
    "sell_price": sellPrice,
    "barcode_number": barcodeNumber,
  };
}
