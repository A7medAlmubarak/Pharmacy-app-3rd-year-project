import '../../config/server_config.dart';
import '../../config/user_info.dart';
import 'package:http/http.dart' as http;

import '../../models/sellbillsdetails.dart';


class SellBillInfoService{

  var msg;
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.showsellBills+"/"+userInformation.select_sellbill_id.toString());


  Future<SellBillDetails?> getdetails(String token) async{
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });


    if (response.statusCode == 200) {
      var sellbillinfo = sellBillDetailsFromJson(response.body);

      return sellbillinfo;
    }
  }
}