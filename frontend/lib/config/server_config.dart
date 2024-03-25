class serverConfig {
  static const domainNameServer = 'http://10.0.2.2:8000';

    //Auth
  static const register ='/api/register';
  static const login ='/api/login';
    //Suppliers
  static const suppliers ='/api/profile/distributor/index';
  static const AddSupplier ='/api/profile/distributor/create';
  static const deleteSupplier ='/api/profile/distributor/delete';
  static const editSupplier ='/api/profile/distributor/edit';
    //Employees
  static const employees ='/api/profile/employee/index';
  static const addEmployee ='/api/profile/employee/create';
  static const dellEmployee ='/api/profile/employee/delete';
  static const editEmployee ='/api/profile/employee/edit';
      //show MyPharmacyMeds
  static const myPharmacyMeds ='/api/profile/med/index';
  static const myPharmacyMedsInfo ='/api/profile/med/show';
  static const myPharmacySearchByName ='/api/profile/med/searchByName';
  static const myPharmacySearchByScientificMaterial ='/api/profile/med/searchByScien';
  static const myPharmacySearchByBarcode ='/api/profile/med/searchByBarcode';

      //show Meds
  static const medsIndex ='/api/med/index';
  static const medsInfo ='/api/med/show';
  static const medsEdit ='/api/med/edit';
  static const addMeds ='/api/med/create';
  static const MedsSearchByName ='/api/med/searchByName';
  static const MedsSearchByScientificMaterial ='/api/med/searchByScien';
  static const MedsSearchByBarcode ='/api/med/searchByBarcode';

      //Bills
  static const buyBills ='/api/profile/buybill/index';
  static const buyBillsSearchBydate ='/api/profile/buybill/searchByDate';
  static const buyBillsSearchById ='/api/profile/buybill/searchByNum';
  static const buyBillsSearchBySupplier ='/api/profile/buybill/searchBySupp';
  static const sellBills ='/api/profile/sellbill/index';
  static const sellBillsSearchBydate ='/api/profile/sellbill/searchByDate';
  static const sellBillsSearchById ='/api/profile/sellbill/searchByNum';
  static const sellBillsSearchByEmployee ='/api/profile/sellbill/searchByEmployee';

  //Show_Bills
  static const showbuyBills ='/api/profile/buybill/show';
  static const showsellBills ='/api/profile/sellbill/show';

  //Return_Bills
  static const showReturns ='/api/profile/returnbill/show';
  static const createReturns ='/api/profile/returnbill/create';


  //Transaction
  static const buyTransaction ='/api/profile/buybill/create';
  static const sellTransaction ='/api/profile/sellbill/create';













}