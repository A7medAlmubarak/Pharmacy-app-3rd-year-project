import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/medicinInfo.dart';
import '../../config/user_info.dart';
import '../../config/server_config.dart';
class MedInfoService{


  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.myPharmacyMedsInfo+"/"+userInformation.select_med_id.toString());
  Future<MedsInfo?> getmedicinInfo(String token) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
     var medsInfo = medsInfoFromJson(response.body);

      return medsInfo;
    }

  }


}