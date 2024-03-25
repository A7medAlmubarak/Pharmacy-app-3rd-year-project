import 'package:get/get.dart';
import './register_service.dart';
import '../../models/admin.dart';
class RegisterController extends GetxController {
  var fullname = "";
  var Pharmacyname = "";
  var location = "";
  var phone="";
  var email = "";
  var password = "";
  var passwordConfirm = "";
  RegisterService service = RegisterService();
  var registerStatus = false;
  var msg;
  var error;

  Future<void> registerOnClick() async {
    admin Admin =admin(fullname:fullname,Pharmacyname:Pharmacyname,Location:location,email:email,password:password,c_password: passwordConfirm,phone: phone);
    registerStatus = await service.register(Admin);
    msg = service.msg;
    error=service.error;
    if(error is List){
      String temp ='';
      for (String s in error) temp +=s+'\n';
      error=temp;
    }
  }
}