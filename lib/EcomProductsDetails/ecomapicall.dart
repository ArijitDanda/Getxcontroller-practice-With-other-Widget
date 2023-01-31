import 'package:get/get.dart';

class EcomApicall extends GetConnect {
  Future<dynamic> getecomproduct({String? varid}) async {
    final response =
        await get('https://demo42.gowebbi.in/api/Product_Api/Details?Id=$varid');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body;
    }
  }
}
