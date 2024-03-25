import 'package:get/get.dart';
import '../modules/edit_user/editUser_controller.dart';

class EditUserBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<EditUserController> (EditUserController());
  }

}