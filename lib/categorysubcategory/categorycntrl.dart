import 'package:get/get.dart';
import 'package:socialmediapracticeapp/categorysubcategory/categoryapicall.dart';

class Categorycntrl extends GetxController with StateMixin<dynamic> {
  final Categoryapicall _catapicall = Categoryapicall();
  @override
  void onInit() {
    super.onInit();
    _catapicall.fetchCategorydata().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (e) {
      change(e, status: RxStatus.error());
      print(e);
    });
  }
}
