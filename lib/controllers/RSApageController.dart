import 'package:cryptography_system/cryptoAlgorithms/RSA.dart';
import 'package:cryptography_system/fileUtils.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:get/get.dart';

class RSApageController extends GetxController {
  String? publicKey;
  String? privateKey;
  String? file1;
  String? result;
  String statusTitle = "Upload a file";
  generateKey() async {
    KeyPair keyPair = await MyRSA.generateKey(numberOfBits: 1024);
    publicKey = keyPair.publicKey;
    privateKey = keyPair.privateKey;
    update();
  }

  readPublicKey() async {
    publicKey = await readFile();
    if (publicKey == null) return;
    update();
  }

  readPrivateKey() async {
    privateKey = await readFile();
    if (privateKey == null) return;

    update();
  }

  readFile1() async {
    file1 = await readFile();
    if (file1 == null) return;
    statusTitle = "Upload another file";
    update();
  }
}
