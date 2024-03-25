import 'package:get/get.dart';
import '../modules/users/users_controller.dart';

class UsersBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<UsersController> (UsersController());
  }

}