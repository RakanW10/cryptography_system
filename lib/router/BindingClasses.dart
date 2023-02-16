import 'package:cryptography_system/controllers/RSApageController.dart';
import 'package:get/get.dart';

class RSApageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}

class RSAEncryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}
class RSADecryptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RSApageController());
  }
}
