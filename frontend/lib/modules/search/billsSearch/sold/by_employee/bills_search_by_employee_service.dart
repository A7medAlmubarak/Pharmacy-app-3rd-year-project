import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../models/sellBills.dart';
import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';
import '../../../../../config/server_config.dart';

class BillsSearchByEmployeeService{
  var msg;
  var error;




  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.sellBillsSearchByEmployee+"/"+userInformation.Sell_bill_search_by_employee_id.toString());




  Future<List<Bill2>>getSellBills(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var sellbills =  sellBillsFromJson(response.body);
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