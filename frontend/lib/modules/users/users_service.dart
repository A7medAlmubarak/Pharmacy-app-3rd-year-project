import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/employee.dart';
import '../../config/user_info.dart';
import '../../config/server_config.dart';

class UsersService {

  var msg;
  var msg2;
  var error;

  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.employees);

  Future<List<Employee>> getAllEmployees(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var employee = employeeFromJson(response.body);
      return employee;
    } else {
      return [];
    }
  }


  Future<bool> deleteEmployee(String token, int id) async {
    var url2 = Uri.parse(serverConfig.domainNameServer +
        serverConfig.dellEmployee +
        "/" +
        id.toString());
    var response2 = await http.get(url2, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });

    if (response2.statusCode == 200) {
      var jsonResponse = jsonDecode(response2.body);
      msg = jsonResponse['msg'];
      return true;
    } else if (response2.statusCode == 404) {
      var jsonResponse = jsonDecode(response2.body);
      msg = jsonResponse['msg'];
      return false;
    } else {
      return false;
    }
  }
}