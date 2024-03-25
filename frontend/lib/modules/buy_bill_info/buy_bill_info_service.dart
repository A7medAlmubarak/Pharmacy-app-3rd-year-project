import '../../config/server_config.dart';
import '../../config/user_info.dart';
import 'package:http/http.dart' as http;

import '../../models/buybilldetails.dart';



class BuyBillInfoService{

  var msg;
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.showbuyBills+"/"+userInformation.select_buybill_id.toString());


  Future<BuyBillDetails?> getdetails(String token) async{
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });


    if (response.statusCode == 200) {

      var buybillinfo = buyBillDetailsFromJson(response.body);
      print('22222222200000000000000000000');
      return buybillinfo;
    }
  }
}