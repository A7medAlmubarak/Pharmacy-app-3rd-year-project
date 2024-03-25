import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/medsList.dart';

import '../../../config/server_config.dart';

class SellProductsListService {
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.myPharmacyMeds);
  Future<List<MedsList>> getAllMeds(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var suppliers = medsListFromJson(response.body);
      return suppliers;
    } else {
      return [];
    }
  }

}