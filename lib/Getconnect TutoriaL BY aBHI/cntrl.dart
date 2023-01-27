import 'package:get/get.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/apicall.dart';

class MyController extends GetxController with StateMixin<List<dynamic>> {
 Apicall1 apicall = Apicall1();
  @override
  void onInit() {
    super.onInit();
    apicall.fetchmakeup().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (e) {
      change(e, status: RxStatus.error(e));
    });
  }
}
