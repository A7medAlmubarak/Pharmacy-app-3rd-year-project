import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/suppliers.dart';
import '../../config/user_info.dart';
import '../../config/server_config.dart';

class SuppliersService {
  var msg;
  var msg2;
  var error;
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.suppliers);
  Future<List<Distributor>> getallsuppliers(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var suppliers = suppliersFromJson(response.body);
      return suppliers.distributor;
    } else {
      return [];
    }
  }

  Future<bool> deleteSupplier(String token, int id) async {
    var url2 = Uri.parse(serverConfig.domainNameServer +
        serverConfig.deleteSupplier +
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
