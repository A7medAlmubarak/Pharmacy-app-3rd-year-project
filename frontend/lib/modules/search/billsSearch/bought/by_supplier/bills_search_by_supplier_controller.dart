import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_supplier_service.dart';
import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';

class BillsSearchBySupplierController extends GetxController {
  BillsSearchBySupplierService service = BillsSearchBySupplierService();

  List<Bill1> buyBillsList=[];

  var isBuyLoading = true.obs;
  var msg;
  var error;



  @override
  void onReady() async {
    // TODO: implement onReady


    buyBillsList=await service.getBuyBills(userInformation.user_Token);
    isBuyLoading(false);

    if(buyBillsList.isEmpty){
      msg=service.msg;
      error=service.error;
      EasyLoading.showToast( msg+"\n"+error,toastPosition:EasyLoadingToastPosition.bottom );

    }


    super.onReady();
  }

}