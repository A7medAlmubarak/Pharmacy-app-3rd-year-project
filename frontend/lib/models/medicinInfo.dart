// To parse this JSON data, do
//
//     final medsInfo = medsInfoFromJson(jsonString);

import 'dart:convert';

MedsInfo medsInfoFromJson(String str) => MedsInfo.fromJson(json.decode(str));

String medsInfoToJson(MedsInfo data) => json.encode(data.toJson());

class MedsInfo {
  MedsInfo({
    required this.id,
    required this.name,
    required this.sellPrice,
    required this.category,
    required this.scientificMaterial,
    required this.company,
    required this.batchs,
    required this.barcode_number
  });

  int id;
  String name;
  int sellPrice;
  String category;
  String scientificMaterial;
  String company;
  List<Batch> batchs;
  String barcode_number;

  factory MedsInfo.fromJson(Map<String, dynamic> json) => MedsInfo(
    id: json["id"],
    name: json["name"],
    sellPrice: json["sell_price"],
    category: json["category"],
    scientificMaterial: json["scientific_material"],
    company: json["company"],
      barcode_number: json["barcode_number"],
    batchs: List<Batch>.from(json["batchs"].map((x) => Batch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sell_price": sellPrice,
    "category": category,
    "scientific_material": scientificMaterial,
    "company": company,
    "barcode_number":barcode_number,
    "batchs": List<dynamic>.from(batchs.map((x) => x.toJson())),
  };
}

class Batch {
  Batch({
    required this.id,
    required this.batchQuantity,
    required this.expiredDate,
  });

  int id;
  int batchQuantity;
  DateTime expiredDate;

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
    id: json["id"],
    batchQuantity: json["batch_quantity"],
    expiredDate: DateTime.parse(json["expired_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "batch_quantity": batchQuantity,
    "expired_date": "${expiredDate.year.toString().padLeft(4, '0')}-${expiredDate.month.toString().padLeft(2, '0')}-${expiredDate.day.toString().padLeft(2, '0')}",
  };
}
