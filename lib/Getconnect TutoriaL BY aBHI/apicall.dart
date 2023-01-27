import 'package:get/get.dart';
class Apicall1 extends GetConnect {
  Future<List<dynamic>> fetchmakeup() async {
    final response = await get(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body;
    }
  }
}
