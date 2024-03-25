import 'package:get/get.dart';
import './suppliers_service.dart';
import '../../config/user_info.dart';
import '../../models/suppliers.dart';
class SuppliersController extends GetxController{
  SuppliersService service= SuppliersService();
  List<Distributor>SuppliersList=[] ;
  var isloading = true.obs;
  var delStatus;
  var addstate;
  var error;
  var msg;

  var name;
  var phone;
  var location;
  var email;

  void onReady() async {
    SuppliersList=await service.getallsuppliers(userInformation.user_Token);
    isloading(false);
    for (Distributor D in SuppliersList )
    print(D.name+"\n"+D.email+"\n"+D.phone);
    super.onReady();
  }
  Future<void>delete(int id)async{
    delStatus=await service.deleteSupplier(userInformation.user_Token, id);
    msg = service.msg;

  }




}