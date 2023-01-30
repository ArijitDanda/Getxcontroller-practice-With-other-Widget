import 'package:get/get.dart';

class Categoryapicall extends GetConnect {
  Future<dynamic> fetchCategorydata() async {
    final response = await get(
        'https://demo42.gowebbi.in/api/MasterApi/FetchSubcategory?CategoryId=2');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body;
    }
  }
}
