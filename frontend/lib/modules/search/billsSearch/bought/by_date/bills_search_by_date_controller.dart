import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_date_service.dart';
import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';

class BuyBillsSearchByDateController extends GetxController {
  BuyBillsSearchByDateService service = BuyBillsSearchByDateService();

  List<Bill1> buyBillsList=[];

  var isBuyLoading = true.obs;
  var msg;
  var error;



  @override
  void onReady() async {
    // TODO: implement onReady


    buyBillsList=await service.getBuyBills(userInformation.user_Token,userInformation.search_bill_date_from,userInformation.search_bill_date_to);
    isBuyLoading(false);

    if(buyBillsList.isEmpty){
      msg=service.msg;
      error=service.error;
      EasyLoading.showToast( msg+"\n"+error,toastPosition:EasyLoadingToastPosition.bottom );

    }


    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    userInformation.search_bill_date_from = DateTime.now();
    userInformation.search_bill_date_to = DateTime.now();
    super.onClose();
  }

}