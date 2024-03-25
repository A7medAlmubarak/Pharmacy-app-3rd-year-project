import 'package:get/get.dart';
import './editMedicin_service.dart';
import '../../config/user_info.dart';

class EditMedicinController extends GetxController {
  EditMedicinService service = EditMedicinService();

  var Name;
  var price;
  var scientific_material;
  var cat;
  var company;
  var editState;
  var msg;
  var error;
  var newName;
  var newPrice;
  var newScientific_material;
  var newCat_id;
  var newCompany;

  Future<void> Edit() async {
    switch (cat) {
      case 'pills':
        newCat_id = 1;
        break;
      case 'Liquid':
        newCat_id = 2;
        break;
      case 'Tablet':
        newCat_id = 3;
        break;
      case 'Drops':
        newCat_id = 4;
        break;
      case 'Suppositories':
        newCat_id = 5;
        break;
      case 'Inhalers':
        newCat_id = 6;
        break;
      case 'Injections':
        newCat_id = 6;
        break;
    }
    editState = await service.Edit(
        userInformation.user_Token, newName, newPrice, newCat_id,
        newScientific_material, newCompany);
    print("test");
    print("controller");
    print(service.msg);
    msg = service.msg;
    error = service.error;
    if (error is List) {
      String temp = '';
      for (String s in error)
        temp += s + '\n';
      error = temp;
    }
  }
}
