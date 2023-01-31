import 'package:get/get.dart';
import 'package:socialmediapracticeapp/EcomProductsDetails/ecomapicall.dart';

class Ecomcntrl extends GetxController with StateMixin<dynamic> {
  final EcomApicall eproduct = EcomApicall();
  // Ecomcntrl(this.val);
  @override
  void onInit() {
    final RxString val = ''.obs;
    print(val);
    super.onInit();
    eproduct.getecomproduct(varid: '20136').then((value) {
      change(value, status: RxStatus.success());
    }, onError: (e) {
      change(e, status: RxStatus.error());
    });
  }
}
