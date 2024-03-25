import 'package:get/get.dart';
import './add_supplier_service.dart';
import '../../config/user_info.dart';
class AddSupplierController extends GetxController{
  AddSupplierService service= AddSupplierService();


  var addstate;
  var error;
  var msg;

  var name;
  var phone;
  var location;
  var email;
  Future<void>addSupplier()async{
    addstate=await service.addsupplier(userInformation.user_Token,name,phone,location,email);
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