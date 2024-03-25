import 'package:get/get.dart';
import './bills_service.dart';
import '../../models/buyBills.dart';
import '../../models/sellBills.dart';
import '../../config/user_info.dart';

class BillsController extends GetxController {
  BillsService service = BillsService();
  List<Bill1> buyBillsList=[];
  List<Bill2> sellBillsList=[];
  var isSellLoading = true.obs;
  var isBuyLoading = true.obs;


  @override
  void onReady() async {
    // TODO: implement onReady
    buyBillsList=await service.getBuyBills(userInformation.user_Token);
    isBuyLoading(false);



    sellBillsList=await service.getSellBills(userInformation.user_Token);
    isSellLoading(false);


    super.onReady();
  }

}