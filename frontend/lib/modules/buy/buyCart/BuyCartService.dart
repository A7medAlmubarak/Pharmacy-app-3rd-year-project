import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/server_config.dart';
import '../../../models/newBuyBill.dart';


class BuyCartService{

  var msg;
  var error;
  Future<bool> CreateBill(String token, List<Med> data,String Dis_id) async {
    var url =
    Uri.parse(serverConfig.domainNameServer + serverConfig.buyTransaction);

    String newbill = buyBillsToJson(NewBuyBill(med: data, distributorId: Dis_id));
    var response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json"
        },
        body: newbill);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      return true;
    } else {
      return false;
    }
  }

}