import 'package:get/get.dart';
import 'package:pharma_project/modules/return_med/return_cart/returncart_service.dart';
import '../../../models/newReturn.dart';

import '../../../config/user_info.dart';

class ReturnCartController extends GetxController {
  ReturnCertService service = ReturnCertService();


  var p = [].obs ;
  //List<product> p = [product(name: "setamol2", price: 100, id: 2, quantity: 3)].obs;


  List<Med> med = [];
  var msg;
  var createState;

  Future<void> CreateBill() async {
    print("id"+userInformation.select_sellbill_id.toString());
    createState = await service.CreateBill(userInformation.user_Token, med,userInformation.select_sellbill_id);

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