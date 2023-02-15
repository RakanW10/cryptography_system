import 'package:cryptography_system/cryptoAlgorithms/RSA.dart';
import 'package:cryptography_system/fileUtils.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:get/get.dart';

class RSApageController extends GetxController {
  String? publicKey;
  String? privateKey;
  generateKey() async {
    KeyPair keyPair = await MyRSA.generateKey(numberOfBits: 1024);
    publicKey = keyPair.publicKey;
    privateKey = keyPair.privateKey;
    update();
  }

  readPublicKey() async {
    publicKey = await readFile();
    update();
  }

  readPrivateKey() async {
    privateKey = await readFile();
    update();
  }
  
}
