import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import 'package:pharma_project/modules/sell_bill_info_returns/sell_bill_info_returns_service.dart';
import '../../modules/Sell_Bill_info/sell_bill_info_controller.dart';

import '../../models/returns.dart';

class SellBillInfoReturnsController extends GetxController {
  SellBillInfoController controller2 = Get.find();
  SellBillInfoReturnsService _service = SellBillInfoReturnsService();
  ReturnBills? billreturns;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    if (controller2.returns.value == 1) {
      billreturns = await _service.getreturns(userInformation.user_Token);
      isloading(false);
      super.onReady();
      print(billreturns!.items.length);
    }
  }
}