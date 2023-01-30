import 'package:get/get.dart';
import 'package:socialmediapracticeapp/categorysubcategory/categorycntrl.dart';

class Categorybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Categorycntrl>(() => Categorycntrl());
  }
}
