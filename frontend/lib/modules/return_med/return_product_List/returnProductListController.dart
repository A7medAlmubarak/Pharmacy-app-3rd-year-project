import 'package:get/get.dart';
import 'package:pharma_project/modules/return_med/return_product_List/returnProductListService.dart';

import '../../../models/medsList.dart';
import '../../../config/user_info.dart';

import '../../../models/sellbillsdetails.dart';
import '../return_cart/returncart_controller.dart';


class ReturnProductsListController extends GetxController{
  ReturnCartController cartController = Get.find();
  ReturnProductsListService service = ReturnProductsListService();
  SellBillDetails? sellbilldetails;
  var quantity;
  var isloading = true.obs;


  void onReady() async {
    sellbilldetails=await service.getAllMeds(userInformation.user_Token);
    isloading(false);

    super.onReady();
  }
  void add(int addId,String addname,double addPrice,int addQuantity){
    cartController.p.add(product(name: addname,price: addPrice,quantity: addQuantity,id: addId));

  }

}