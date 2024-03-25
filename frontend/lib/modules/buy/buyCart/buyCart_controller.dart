import 'package:get/get.dart';
import '../../../models/newBuyBill.dart';

import '../../../config/user_info.dart';
import 'BuyCartService.dart';

class BuyCartController extends GetxController{

  BuyCartService service = BuyCartService();

  var p = [].obs ;

  List<Med> med = [];
  var msg;
  var createState;


  Future<void> CreateBill() async {
    createState = await service.CreateBill(userInformation.user_Token, med,userInformation.Buy_Supplier_id);

    print(service.msg);
    msg = service.msg;
  }

}

class product {
  final String? name;
  final double price;
  int id;
  final int quantity;
  product(
      {this.name,
        required this.price,
        required this.id,
        required this.quantity});
}