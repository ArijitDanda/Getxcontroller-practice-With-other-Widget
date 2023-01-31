import 'package:get/get.dart';
import 'package:socialmediapracticeapp/EcomProductsDetails/ecomcntrl.dart';

class Ecombinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Ecomcntrl>(() => Ecomcntrl());
  }
}
