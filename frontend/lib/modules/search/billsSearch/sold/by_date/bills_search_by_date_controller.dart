import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_date_service.dart';
import '../../../../../models/sellBills.dart';
import '../../../../../config/user_info.dart';

class SellBillsSearchByDateController extends GetxController {
  SellBillsSearchByDateService service = SellBillsSearchByDateService();

  List<Bill2> sellBillsList=[];

  var isSellLoading = true.obs;
  var msg;
  var error;



  @override
  void onReady() async {
    // TODO: implement onReady


    sellBillsList=await service.getSellBills(userInformation.user_Token,userInformation.search_bill_date_from,userInformation.search_bill_date_to);
    isSellLoading(false);

    if(sellBillsList.isEmpty){
      msg=service.msg;
      error=service.error;
      EasyLoading.showToast( msg+"\n"+error,toastPosition:EasyLoadingToastPosition.bottom );

    }


    super.onReady();
  }

  void onClose() {
    // TODO: implement onClose
    userInformation.search_bill_date_from = DateTime.now();
    userInformation.search_bill_date_to = DateTime.now();
    super.onClose();
  }

}