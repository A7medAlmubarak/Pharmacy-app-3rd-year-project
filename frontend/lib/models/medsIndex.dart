// To parse this JSON data, do
//
//     final medsIndex = medsIndexFromJson(jsonString);

import 'dart:convert';

MedsIndex medsIndexFromJson(String str) => MedsIndex.fromJson(json.decode(str));

String medsIndexToJson(MedsIndex data) => json.encode(data.toJson());

class MedsIndex {
  MedsIndex({
    required this.meds,
  });

  List<Med> meds;

  factory MedsIndex.fromJson(Map<String, dynamic> json) => MedsIndex(
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
    required this.sellPrice,
    required this.category,
    required this.scientificMaterial,
    required this.company,
    required this.barcode_number
  });

  int id;
  String name;
  int sellPrice;
  String category;
  String scientificMaterial;
  String company;
  String barcode_number;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
    id: json["id"],
    name: json["name"],
    sellPrice: json["sell_price"],
    category: json["category"],
    scientificMaterial: json["scientific_material"],
    company: json["company"],
      barcode_number: json["barcode_number"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sell_price": sellPrice,
    "category": category,
    "scientific_material": scientificMaterial,
    "company": company,
    "barcode_number":barcode_number
  };
}
