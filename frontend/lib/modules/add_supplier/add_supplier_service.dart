import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
class AddSupplierService {
  var msg;
  var error;

  Future<bool> addsupplier(String token, String name, String phone,
      String location, String email) async {
    var url =
    Uri.parse(serverConfig.domainNameServer + serverConfig.AddSupplier);
    var response3 = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    }, body: {
      'name': name,
      'location': location,
      'phone': phone,
      'email': email
    });
    if (response3.statusCode == 200) {
      var jsonResponse = jsonDecode(response3.body);
      msg = jsonResponse['msg'];
      return true;
    }else if(response3.statusCode==404){
      var jsonResponse = jsonDecode(response3.body);
      msg = jsonResponse['msg'];
      error=jsonResponse['errors'];
      return false;
    }else {
      return false;
    }
  }


}