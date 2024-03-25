import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';
import '../../../../../config/server_config.dart';

class BuyBillsSearchByDateService{
  var msg;
  var error;




  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.buyBillsSearchBydate);

  Future<List<Bill1>>getBuyBills(String token,DateTime from,DateTime to) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    },body: {
      'fromdate':from.toString(),
      'todate':to.toString()
    });
    //print (from.toString()+"   "+to.toString());
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