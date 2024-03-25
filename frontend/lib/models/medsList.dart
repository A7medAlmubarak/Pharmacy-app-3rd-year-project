// To parse this JSON data, do
//
//     final medsList = medsListFromJson(jsonString);

import 'dart:convert';

List<MedsList> medsListFromJson(String str) =>
    List<MedsList>.from(json.decode(str).map((x) => MedsList.fromJson(x)));

String medsListToJson(List<MedsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedsList {
  MedsList(
      {required this.id,
      required this.name,
      required this.sellPrice,
      required this.storageQuantity,
      required this.barcode_number});

  int id;
  String name;
  int sellPrice;
  int storageQuantity;
  String barcode_number;

  factory MedsList.fromJson(Map<String, dynamic> json) => MedsList(
      id: json["id"],
      name: json["name"],
      sellPrice: json["sell_price"],
      storageQuantity: json["storage_quantity"],
      barcode_number: json["barcode_number"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sell_price": sellPrice,
        "storage_quantity": storageQuantity,
        "barcode_number":barcode_number
      };
}
