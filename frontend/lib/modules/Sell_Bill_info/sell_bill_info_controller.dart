import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import 'package:pharma_project/models/sellbillsdetails.dart';
import 'package:pharma_project/modules/Sell_Bill_info/sell_bill_info_service.dart';

class SellBillInfoController extends GetxController{

  SellBillInfoService _service = SellBillInfoService();
  SellBillDetails? sellbilldetails;
  var isloading = true.obs;
  var returns = 0.obs;
  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() async {
    sellbilldetails = await _service.getdetails(userInformation.user_Token);
    isloading(false);
    returns.value = sellbilldetails!.returnStatus;
    super.onReady();
  }
}