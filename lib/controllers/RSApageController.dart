import 'package:cryptography_system/cryptoAlgorithms/RSA.dart';
import 'package:cryptography_system/fileUtils.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:get/get.dart';

class RSApageController extends GetxController {
  String? publicKey;
  String? privateKey;
  String? file1;
  String? file2;

  String file1StatusTitle = "Upload a file";
  String file2StatusTitle = "Upload a file";

  resetFiles() {
    file1 = null;
    file2 = null;
    file1StatusTitle = "Upload a file";
    file2StatusTitle = "Upload a file";
    update();
  }

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
    file1StatusTitle = "Upload another file";
    update();
  }

  readFile2() async {
    file2 = await readFile();
    if (file2 == null) return;
    file2StatusTitle = "Upload another file";
    update();
  }
}
