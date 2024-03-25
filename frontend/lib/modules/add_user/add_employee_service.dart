import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
class AddEmployeeService {
  var msg;
  var error;

  Future<bool> addsEmployee(String token, String name, String phone,
       String email,String password,String c_password) async {
    var url =
    Uri.parse(serverConfig.domainNameServer + serverConfig.addEmployee);
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    }, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password':password,
      'c_password':c_password
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      return true;
    }else if(response.statusCode==404){
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      error=jsonResponse['errors'];
      return false;
    }else {
      return false;
    }
  }


}