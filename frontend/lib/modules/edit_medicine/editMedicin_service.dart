import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_project/config/user_info.dart';
import '../../config/server_config.dart';

class EditMedicinService {
  var msg;
  var error;

  Future<bool> Edit(String token, String name, String price, int cat_id,
      String Scientific_material, String company) async {
    var url =
        Uri.parse(serverConfig.domainNameServer + serverConfig.medsEdit+"/"+userInformation.Edit_id.toString());
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    }, body: {
      'name': name,
      'sell_price': price,
      'category_id': cat_id.toString(),
      'scientific_material': Scientific_material,
      'company': company,
    });
    print("service");
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      return true;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      error = jsonResponse['errors'];
      return false;
    } else {
      return false;
    }
  }
}
