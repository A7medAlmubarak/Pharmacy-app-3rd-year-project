import 'package:get/get.dart';

import './add_employee_service.dart';
import '../../config/user_info.dart';
class AddEmployeeController extends GetxController{
  AddEmployeeService service= AddEmployeeService();


  var addstate;
  var error;
  var msg;

  var name;
  var email;
  var phone;
  var password;
  var c_password;
  Future<void>addEmployee()async{
    addstate=await service.addsEmployee(userInformation.user_Token,name,phone,email,password,c_password);
    print("test");
    print(service.msg);
    msg =service.msg;

    error=service.error;
    if(error is List){
      String temp ='';
      for (String s in error) temp +=s+'\n';
      error=temp;
    }

  }
}