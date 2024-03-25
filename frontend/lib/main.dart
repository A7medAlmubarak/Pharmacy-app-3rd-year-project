import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pharma_project/getx_bindings/add_medicin_binding.dart';

import './modules/landing/landing.dart';
import './modules/login/login.dart';
import './modules/home/home.dart';
import './modules/users/users.dart';
import './modules/supplier/suppliers.dart';
import './modules/register/register.dart';
import './modules/add_supplier/add_supplier.dart';
import './modules/medicine_info/medicin_info.dart';
import './modules/add_user/add_employee.dart';
import './modules/Bills/bills.dart';
import './modules/meds/meds.dart';
import './modules/edit_medicine/editMedicin.dart';
import './modules/add_medicine/add_medicin.dart';
import './modules/sell/sellCart/sellCart.dart';
import './modules/sell/sellProductsList/sellProductsList.dart';
import './modules/buy/buyCart/buyCart.dart';
import './modules/buy/buyProductsList/buyProductsList.dart';
import './modules/edit_user/editUser.dart';
import './modules/edit_supplier/editsupplier.dart';
import './modules/Sell_Bill_info/sell_bill_Info.dart';
import './modules/return_med/return_cart/returnCart.dart';
import './modules/return_med/return_product_List/returnProductList.dart';
import './modules/sell_bill_info_returns/sell_bill_info_returns.dart';
import './modules/search/homeSearch/by_name/home_search_by_name.dart';
import './modules/search/homeSearch/by_scientific_material/home_search_by_scientific_material.dart';
import './modules/search/homeSearch/by_barcode/home_search_by_barcode.dart';
import './modules/search/medsSearch/by_name/meds_search_by_name.dart';
import './modules/search/medsSearch/by_barcode/meds_search_by_barcode.dart';
import './modules/search/medsSearch/by_scientific_material/meds_search_by_scientific_material.dart';
import './modules/search/billsSearch/sold/by_employee/bills_search_by_employee.dart';
import './modules/search/billsSearch/bought/by_supplier/bills_search_by_supplier.dart';
import './modules/search/billsSearch/bought/by_number/bills_search_by_number.dart';
import './modules/search/billsSearch/bought/by_date/bills_search_by_date.dart';
import './modules/search/billsSearch/sold/by_date/bills_search_by_date.dart';
import './modules/search/billsSearch/sold/by_number/bills_search_by_number.dart';
import './modules/splash/splash.dart';
import './modules/buy_bill_info/buy_bill_info.dart';

import './getx_bindings/landing_binding.dart';
import './getx_bindings/login_binding.dart';
import './getx_bindings/home_binding.dart';
import './getx_bindings/suppliers_binding.dart';
import './getx_bindings/users_binding.dart';
import './getx_bindings/register_binding.dart';
import './getx_bindings/add_supplier_binding.dart';
import './getx_bindings/medicin_info_binding.dart';
import './getx_bindings/add_employee_binding.dart';
import './getx_bindings/bills_binding.dart';
import './getx_bindings/meds_binding.dart';
import './getx_bindings/Edit_binding.dart';
import './getx_bindings/sell_cart_binding.dart';
import './getx_bindings/sell_products_list_binding.dart';
import './getx_bindings/buy_cart_binding.dart';
import './getx_bindings/buy_products_list_binding.dart';
import './getx_bindings/edit_User_binding.dart';
import './getx_bindings/edit_supplier_binding.dart';
import './getx_bindings/sell_bill_info_binding.dart';
import 'getx_bindings/return_cart_binding.dart';
import 'getx_bindings/return_product_list_binding.dart';
import 'getx_bindings/sell_bill_info_returns_bimding.dart';
import 'getx_bindings/home_search_by_name_binding.dart';
import 'getx_bindings/home_search_by_scientific_material_binding.dart';
import 'getx_bindings/home_search_by_barcode_binding.dart';
import 'getx_bindings/meds_search_by_name_binding.dart';
import 'getx_bindings/meds_search_by_barcode_binding.dart';
import 'getx_bindings/meds_search_by_scientific_material_binding.dart';
import 'getx_bindings/sell_bills_search_by_employee_binding.dart';
import 'getx_bindings/buy_bills_search_by_supplier_binding.dart';
import 'getx_bindings/buy_bills_search_by_number_binding.dart';
import 'getx_bindings/buy_bills_search_by_date_binding.dart';
import 'getx_bindings/sell_bills_search_by_date_binding.dart';
import 'getx_bindings/sell_bills_search_by_number_binding.dart';
import 'getx_bindings/splash_binding.dart';
import 'getx_bindings/buy_bill_info_binding.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/Splash',
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: "/Splash",
        page: () => Splash(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: "/Landing",
        page: () => Landing(),
        binding: LandingBinding(),
      ),
      GetPage(
        name: "/Login",
        page: () => Login(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: "/Register",
        page: () => Register(),
        binding: RegisterBinding(),
      ),
      GetPage(
        name: "/Home",
        page: () => Home(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: "/Suppliers",
        page: () => Suppliers(),
        binding: SuppliersBinding(),
      ),
      GetPage(
        name: "/AddSupplier",
        page: () => AddSupplier(),
        binding: AddSupplierBinding(),
      ),
      GetPage(
        name: "/Users",
        page: () => Users(),
        binding: UsersBinding(),
      ),
      GetPage(
        name: "/MedInfo",
        page: () => MedInfo(),
        binding: MedInfoBinding(),
      ),
      GetPage(
        name: "/AddEmployee",
        page: () => AddEmployee(),
        binding: AddEmployeeBinding(),
      ),
      GetPage(
        name: "/Bills",
        page: () => Bills(),
        binding: BillsBinding(),
      ),
      GetPage(
        name: "/Meds",
        page: () => Meds(),
        binding: MedsBinding(),
      ),
      GetPage(
        name: "/Edit",
        page: () => EditMedicin(),
        binding: EditBinding(),
      ),
      GetPage(
        name: "/Add",
        page: () => AddMedicin(),
        binding: AddMedicinBinding(),
      ),
      GetPage(
        name: "/SellCart",
        page: () => SellCart(),
        binding: SellCartBinding(),
      ),
      GetPage(
        name: "/SellProductsList",
        page: () => SellProductsList(),
        binding: SellProductsListBinding(),
      ),
      GetPage(
        name: "/BuyCart",
        page: () => BuyCart(),
        binding: BuyCartBinding(),
      ),
      GetPage(
        name: "/BuyProductsList",
        page: () => BuyProductsList(),
        binding: BuyProductsListBinding(),
      ),
      GetPage(
        name: "/EditUser",
        page: () => EditUser(),
        binding: EditUserBinding(),
      ),
      GetPage(
        name: "/Editsupplier",
        page: () => EditSupplier(),
        binding: EditSupplierBinding(),
      ),
      GetPage(
        name: "/SellBillInfo",
        page: () => SellBillInfo(),
        binding: SellBillInfoBinding(),
      ),
      GetPage(
        name: "/SellBillInfoReturns",
        page: () => SellBillInfoReturns(),
        binding: SellBillInfoReturnsBinding(),
      ),
      GetPage(
        name: "/ReturnCart",
        page: () => ReturnCart(),
        binding: ReturnCartBinding(),
      ),
      GetPage(
        name: "/ReturnProductsList",
        page: () => ReturnProductsList(),
        binding: ReturnProductsListBinding(),
      ),
      GetPage(
        name: "/HomeSearchByName",
        page: () => HomeSearchByName(),
        binding: HomeSearchByNameBinding(),
      ),
      GetPage(
        name: "/HomeSearchBySN",
        page: () => HomeSearchByScientificMaterial(),
        binding: HomeSearchByScientificMaterialBinding(),
      ),
      GetPage(
        name: "/HomeSearchByBarcode",
        page: () => HomeSearchByBarcode(),
        binding: HomeSearchByBarcodeBinding(),
      ),
      GetPage(
        name: "/MedsSearchByName",
        page: () => MedsSearchByName(),
        binding: MedsSearchByNameBinding(),
      ),
      GetPage(
        name: "/MedsSearchBySN",
        page: () => MedsSearchByScientificMaterial(),
        binding: MedsSearchByScientificMaterialBinding(),
      ),
      GetPage(
        name: "/MedsSearchByBarcode",
        page: () => MedsSearchByBarcode(),
        binding: MedsSearchByBarcodeBinding(),
      ),
      GetPage(
        name: "/EmployeeSellHistory",
        page: () => BillsSearchByEmployee(),
        binding: SellBillSearchByEmployeeBinding(),
      ),
      GetPage(
        name: "/SupplierBuyHistory",
        page: () => BillsSearchBySupplier(),
        binding: BuyBillSearchBySupplierBinding(),
      ),
      GetPage(
        name: "/BuyBillsSearchByID",
        page: () => BuyBillsSearchByNumber(),
        binding: BuyBillSearchByNumberBinding(),
      ),
      GetPage(
        name: "/BuyBillsSearchByDate",
        page: () => BuyBillsSearchByDate(),
        binding: BuyBillSearchByDateBinding(),
      ),
      GetPage(
        name: "/SellBillsSearchByDate",
        page: () => SellBillsSearchByDate(),
        binding: SellBillSearchByDateBinding(),
      ),
      GetPage(
        name: "/SellBillsSearchByID",
        page: () => SellBillsSearchByNumber(),
        binding: SellBillSearchByNumberBinding(),
      ),
      GetPage(
        name: "/BuyBillInfo",
        page: () => BuyBillInfo(),
        binding: BuyBillInfoBinding(),
      ),
    ],
    builder: EasyLoading.init(),
  ));
}
