import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../models/medsIndex.dart';
import '../../../../config/user_info.dart';
import '../../../../config/server_config.dart';
class MedsSearchByNameService{
  var msg;
  var error;


  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.MedsSearchByName);
  Future<List<Med>> getAllMeds(String token) async {
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    },body: {
      "name":userInformation.Search_by_name,
    });
    if (response.statusCode == 200) {
      var list = medsIndexFromJson(response.body);
      return list.meds;
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