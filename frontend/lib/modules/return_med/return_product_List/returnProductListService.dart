import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/medsList.dart';
import '../../../config/user_info.dart';
import '../../../config/server_config.dart';
import '../../../models/sellbillsdetails.dart';

class ReturnProductsListService {
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.showsellBills+"/"+userInformation.select_sellbill_id.toString());
  Future<SellBillDetails?> getAllMeds(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var suppliers = sellBillDetailsFromJson(response.body);
      return suppliers;
    }

  }

}