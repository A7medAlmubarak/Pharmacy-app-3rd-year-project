import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_number_service.dart';
import '../../../../../models/buyBills.dart';
import '../../../../../config/user_info.dart';

class BuyBillsSearchByNumberController extends GetxController {
  BuyBillsSearchByNumberService service = BuyBillsSearchByNumberService();

  List<Bill1> buyBillsList=[];

  var isBuyLoading = true.obs;
  var msg;
  var error;
  var findstates;



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

  @override
  void onClose() {
    // TODO: implement onClose
    userInformation.Search_Bill_ID="";
    super.onClose();
  }

}