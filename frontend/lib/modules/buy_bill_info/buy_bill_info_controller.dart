import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import 'package:pharma_project/models/buybilldetails.dart';
import 'package:pharma_project/models/sellbillsdetails.dart';
import 'package:pharma_project/modules/Sell_Bill_info/sell_bill_info_service.dart';

import 'buy_bill_info_service.dart';

class BuyBillInfoController extends GetxController{

  BuyBillInfoService _service = BuyBillInfoService();
  BuyBillDetails? buybilldetails;
  var isloading = true.obs;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() async {
    print('onnnnn reeeeeeeeeeeady');
    buybilldetails = await _service.getdetails(userInformation.user_Token);

    print('onnnnn reeeeeeeeeeeady 2222222222222222222');
    isloading(false);
    print('onnnnn reeeeeeeeeeeady 333333333333333333333333');

    super.onReady();
  }
}