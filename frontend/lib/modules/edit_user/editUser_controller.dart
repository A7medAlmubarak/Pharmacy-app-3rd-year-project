import 'package:get/get.dart';
import './editUser_service.dart';
import '../../config/user_info.dart';

class EditUserController extends GetxController {
  EditUserService service = EditUserService();


  var editState;
  var msg;
  var error;
  var newName;
  var newPhone;
  var newEmail;



  Future<void> Edit() async {

    editState = await service.Edit(
        userInformation.user_Token, newName, newEmail, newPhone,
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
