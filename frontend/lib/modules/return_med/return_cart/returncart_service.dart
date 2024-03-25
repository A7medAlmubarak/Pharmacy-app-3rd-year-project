import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma_project/config/user_info.dart';
import '../../../config/server_config.dart';
import '../../../models/newReturn.dart';


class ReturnCertService {
  var msg;
  var error;
  //var token11="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Njc2YWZhYi1kYTQ1LTQ4NzctOTU3Yy0yYmQzNjZlZjVlZTYiLCJqdGkiOiI4OWE5MzRkN2I3Y2RlYzM3YTZkNTQwYzZhYjE4MDI1NTQzYTc2ODVhZGIyZTQwZDg3ZmRlOTFiNDU3YjI5MGY0YTExN2FiNjUxMzJhOTdkZCIsImlhdCI6MTY2MDIzMDk1MS44NjU2NTMsIm5iZiI6MTY2MDIzMDk1MS44NjU2NTUsImV4cCI6MTY5MTc2Njk1MS44NTk5NTIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.VpmkwEOpUYQI-_Hu0T4vJkQg9XLM47P7JqPFD3BibOvlTLJRWhoXnPlnj4Vac8zL8hRMXdSiAMkHU9w5H3TClfjfCzf4ZWHMBS4xPlOa3MZOtQ3Sbls9L0MLcJRl8rpJW15XhSpm0ZwlI4ghviHLbCMmykUi2vgJyXsro0nz3DKhkoNwZm4HRp1HhjJE5YISkP-4TYTXFIJejMaaDYLlzriPoazbv6NYDqNlBmLCYZTEjcOxiAPI7EEzTyUivcSmdtvMdLEoh-Hy-ybPO8V6H08OL_QL5cL94zZp6jiU3QUV3MHR_yfWPZxlJKmQP-hKl_JXMnzPoYyjv4nmanH_18W5VuACmHwhdfx3pHjpCgOMbD6XkJX99UlzPeHGTPCAFN8rWD1S0srZPHy0qfawBiguB-oiZSlpdFzN2xi6H00hbk7-mtyphPfo--i5ZL9X-tudv831xlDPcOtxXt8dRWRJIq7431w0U0E30UwKeM8A79HM0-B_uJ01EJ6bZ4PxLLG-aYZ_dmucv31l0vp5ZaVRoBQbFOjugpjVhiy25nxgWDrV9egKlKBFoXLcyZJ-RaeQxVApqyBU60rw9Hne29cYMo8AGCsq_dSvk1Tfl2ugrY-8xiyNezhQWKu0yJHgDLRSu8wJpf-7GcRwP1E1GxHndkG-YoSq73MAVE2akRo";
  Future<bool> CreateBill(String token, List<Med> data,int bill_id) async {
    var url =
    Uri.parse(serverConfig.domainNameServer + "/api/profile/returnbill/create");

    String Newreturn = returnBillNewToJson(ReturnBillNew( med: data));
    print(Newreturn);
    print(url);
    var response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json"
        },
        body: Newreturn);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      msg = jsonResponse['msg'];
      return true;
    } else  if (response.statusCode == 500){
      print (response.body);
      msg="server error";
      return false;
    }else {
      return false;
    }

  }
}
