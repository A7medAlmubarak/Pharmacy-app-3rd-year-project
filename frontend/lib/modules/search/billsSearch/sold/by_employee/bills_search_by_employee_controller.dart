import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_employee_service.dart';
import '../../../../../models/sellBills.dart';
import '../../../../../config/user_info.dart';

class BillsSearchByEmployeeController extends GetxController {
  BillsSearchByEmployeeService service = BillsSearchByEmployeeService();

  List<Bill2> sellBillsList=[];
  var isSellLoading = true.obs;
  var msg;
  var error;



  @override
  void onReady() async {
    // TODO: implement onReady


    sellBillsList=await service.getSellBills(userInformation.user_Token);
    isSellLoading(false);
    if(sellBillsList.isEmpty){
      msg=service.msg;
      error=service.error;
      EasyLoading.showToast( msg+"\n"+error,toastPosition:EasyLoadingToastPosition.bottom );

    }


    super.onReady();
  }

}