import 'package:get/get.dart';
import '../modules/add_user/add_employee_controller.dart';

class AddEmployeeBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<AddEmployeeController> (AddEmployeeController());
  }

}