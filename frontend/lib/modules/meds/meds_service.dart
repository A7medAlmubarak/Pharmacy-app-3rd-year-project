import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/medsIndex.dart';
import '../../config/user_info.dart';
import '../../config/server_config.dart';

class MedsService {
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.medsIndex);
  Future<List<Med>> getAllMeds(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var suppliers = medsIndexFromJson(response.body);
      return suppliers.meds;
    } else {
      return [];
    }
  }
}
