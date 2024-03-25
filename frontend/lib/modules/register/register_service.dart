import 'dart:convert';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;
import '../../models/admin.dart';
class RegisterService {

  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.register);
  var msg;
  var error ;
  Future<bool> register(admin Admin) async{
  var response =await  http.post(
  url,
  headers: {
    "Accept":"application/json"
  },
  body: {
  'name': Admin.fullname,
  'email': Admin.email,
  'pharmacy_name':Admin.Pharmacyname,
  'location':Admin.Location,
  'password': Admin.password,
  'phone':Admin.phone,
  "c_password": Admin.c_password,
  },
  );
  print(response.statusCode);
  print(response.body);
  if(response.statusCode==200){
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