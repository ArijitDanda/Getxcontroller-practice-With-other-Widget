import 'package:get/get.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/cntrl.dart';

class Makeupclassbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }
}
