import 'package:get/get.dart';
import './editSupplier_service.dart';
import '../../config/user_info.dart';

class EditSupplierController extends GetxController {
  EditSupplierService service = EditSupplierService();


  var editState;
  var msg;
  var error;
  var newName;
  var newPhone;
  var newEmail;
  var newLocation;



  Future<void> Edit() async {

    editState = await service.Edit(
        userInformation.user_Token, newName, newEmail, newPhone,newLocation
        );
    print("test");
    print("controller");
    print(service.msg);
    msg = service.msg;
    error = service.error;
    if (error is List) {
      String temp = '';
      for (String s in error)
        temp += s + '\n';
      error = temp;
    }
  }
}
