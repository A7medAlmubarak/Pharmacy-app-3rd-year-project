import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';
import '../../../../../config/server_config.dart';

class BillsSearchBySupplierService{
  var msg;
  var error;




  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.buyBillsSearchBySupplier+"/"+userInformation.Buy_bill_search_by_supplier_id.toString());

  Future<List<Bill1>>getBuyBills(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
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