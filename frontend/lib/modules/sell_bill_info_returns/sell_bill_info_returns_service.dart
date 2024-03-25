import '../../config/server_config.dart';
import '../../config/user_info.dart';
import 'package:http/http.dart' as http;

import '../../models/returns.dart';
import '../../models/sellbillsdetails.dart';


class SellBillInfoReturnsService{

  var msg;
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.showReturns+"/"+userInformation.select_sellbill_id.toString());


  Future<ReturnBills?> getreturns(String token) async{
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var returns = returnBillsFromJson(response.body);

      return returns;
    }
  }
}