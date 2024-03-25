import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './bills_search_by_number_service.dart';
import '../../../../../models/sellBills.dart';
import '../../../../../config/user_info.dart';

class SellBillsSearchByNumberController extends GetxController {
  SellBillsSearchByNumberService service = SellBillsSearchByNumberService();

  List<Bill2> sellBillsList=[];

  var isSellLoading = true.obs;
  var msg;
  var error;
  var findstates;



  @override
  void onReady() async {
    // TODO: implement onReady

    sellBillsList=await service.getBuyBills(userInformation.user_Token);
    isSellLoading(false);

    if(sellBillsList.isEmpty){
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