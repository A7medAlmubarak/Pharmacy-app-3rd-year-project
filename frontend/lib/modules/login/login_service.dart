import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/user.dart';
import '../../config/user_info.dart';
import '../../native_service/secure_storage.dart';


class LoginService {
  var url = Uri.parse(serverConfig.domainNameServer + serverConfig.login);
  var error ;

  var token;

  Future<bool> login(User u) async{
    var response =await http.post(url,
        body: {
          "email": u.email,
          'password':u.password,


        }
        ,headers: {
        "Accept":"application/json"
        }
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
        error = jsonResponse['msg'];
        token = jsonResponse['token'];
        Securestorage storage = Securestorage();
        storage.save("Token", token);
        userInformation.user_Token= token;
        userInformation.user_name=jsonResponse['name'];
        userInformation.user_email=jsonResponse['email'];
        userInformation.user_id=jsonResponse['id'];
        return true;
      }else if(response.statusCode==404) {
      var jsonResponse = jsonDecode(response.body);
      error = jsonResponse['msg'];
      return false;

    }else {
      return false;
    }




    }


  }



