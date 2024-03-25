import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../models/sellBills.dart';

import '../../../../../config/server_config.dart';

class SellBillsSearchByDateService {
  var msg;
  var error;

  var url = Uri.parse(
      serverConfig.domainNameServer + serverConfig.buyBillsSearchBydate);



  Future<List<Bill2>>getSellBills(String token,DateTime from,DateTime to) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    },body: {
      'fromdate':from.toString(),
      'todate':to.toString()
    });
    //print (from.toString()+"   "+to.toString());
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
