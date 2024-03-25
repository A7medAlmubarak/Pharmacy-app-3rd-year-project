import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';
import '../../../../../config/server_config.dart';

class BuyBillsSearchByNumberService{
  var msg;
  var error;
  var buybill;





  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.buyBillsSearchById);

  Future<List<Bill1>>getBuyBills(String token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    },body: {
      'num':userInformation.Search_Bill_ID
    });
    if (response.statusCode == 200) {
      var buybills = buyBillsFromJson(response.body);
      return buybills.bills;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      error= jsonResponse['errors'];
      return [];
    }else {
      return [];
    }
  }




}