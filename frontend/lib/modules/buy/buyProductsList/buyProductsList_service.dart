import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/medsIndex.dart';
import '../../../models/medsList.dart';

import '../../../config/server_config.dart';

class BuyProductsListService {
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.medsIndex);
  // Future<List<MedsList>> getAllMeds(String token) async {
  //   var response = await http.get(url, headers: {
  //     'Authorization': 'Bearer $token',
  //     "Accept": "application/json"
  //   });
  //   if (response.statusCode == 200) {
  //     var suppliers = medsListFromJson(response.body);
  //     return suppliers;
  //   } else {
  //     return [];
  //   }
  // }

  Future<List<Med>> getAllMeds(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var suppliers = medsIndexFromJson(response.body);
      return suppliers.meds;
    } else {
      return [];
    }
  }

}