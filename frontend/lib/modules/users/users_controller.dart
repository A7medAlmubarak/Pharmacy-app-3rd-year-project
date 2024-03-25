import 'package:get/get.dart';
import './users_service.dart';
import '../../models/employee.dart';
import '../../config/user_info.dart';
class UsersController extends GetxController{
  UsersService service = UsersService();
  List<Employee>EmployeesList=[];
  var isloading = true.obs;
  var delStatus;
  var addstate;
  var error;
  var msg;


  void onReady() async {
    EmployeesList=await service.getAllEmployees(userInformation.user_Token);
    isloading(false);
    for (Employee E in EmployeesList )
      print(E.name+"\n"+E.email+"\n"+E.phone);
    super.onReady();
  }

  Future<void>delete(int id)async{
    delStatus=await service.deleteEmployee(userInformation.user_Token, id);
    msg = service.msg;

  }



}