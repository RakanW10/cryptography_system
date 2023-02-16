import 'package:fast_rsa/fast_rsa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRSA {
  MyRSA();

  static generateKey({required int numberOfBits}) async {
    return await RSA.generate(numberOfBits);
  }

  static encrypt({required String plaintext, required String publicKey}) async {
    var ciphertext = await RSA.encryptPKCS1v15(plaintext, publicKey);
    return ciphertext;
  }

  static decrypt(
      {required String ciphertext, required String privateKey}) async {
    var plaintext = await RSA.decryptPKCS1v15(ciphertext, privateKey);
    return plaintext;
  }

  static sign({required String plaintext, required String privateKey}) async {
    var signature = await RSA.signPKCS1v15(plaintext, Hash.SHA256, privateKey);
    return signature;
  }

  static verify({
    required String signature,
    required String plaintext,
    required String publicKey,
  }) async {
    try {
      bool verified = await RSA.verifyPKCS1v15(
          signature, plaintext, Hash.SHA256, publicKey);
      return verified;
    } catch (e) {
      Get.snackbar(
        "Result",
        "The dosen't signature match",
        colorText: Colors.white,
      );
    }
  }
}
