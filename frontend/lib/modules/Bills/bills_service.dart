import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/sellBills.dart';
import '../../models/buyBills.dart';
import '../../config/user_info.dart';
import '../../config/server_config.dart';

class BillsService{



  var url1 = Uri.parse(serverConfig.domainNameServer + serverConfig.buyBills);

  Future<List<Bill1>>getBuyBills(String token) async {
    var response = await http.get(url1, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var buybills = buyBillsFromJson(response.body);
      return buybills.bills;
    } else {
      return [];
    }
  }

  var url2 = Uri.parse(serverConfig.domainNameServer + serverConfig.sellBills);
  Future<List<Bill2>>getSellBills(String token) async {
    var response = await http.get(url2, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var sellbills =  sellBillsFromJson(response.body);
      return sellbills.bills;
    } else {
      return [];
    }
  }

}