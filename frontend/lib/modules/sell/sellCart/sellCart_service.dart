import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/server_config.dart';
import '../../../models/newSellBill.dart';

class SellCertService {
  var msg;
  var error;

  Future<bool> CreateBill(String token, List<Med> data) async {
    var url =
        Uri.parse(serverConfig.domainNameServer + serverConfig.sellTransaction);

    String newbill = sellBillsToJson(NewSellBill(med: data));
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
