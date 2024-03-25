import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../models/sellBills.dart';
import '../../../../../config/user_info.dart';
import '../../../../../config/server_config.dart';

class SellBillsSearchByNumberService{
  var msg;
  var error;
  var buybill;





  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.sellBillsSearchById);

  Future<List<Bill2>>getBuyBills(String token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    },body: {
      'num':userInformation.Search_Bill_ID
    });
    if (response.statusCode == 200) {
      var sellbills = sellBillsFromJson(response.body);
      return sellbills.bills;
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