import 'package:fast_rsa/fast_rsa.dart';

class MyRSA {
  KeyPair keys;

  MyRSA({required this.keys});

  static generateKey({required int numberOfBits}) async {
    return await RSA.generate(numberOfBits);
  }

  encript({required String plaintext}) async {
    var ciphertext = await RSA.encryptPKCS1v15(plaintext, keys.publicKey);
    return ciphertext;
  }

  decript({required String ciphertext}) async {
    var plaintext = await RSA.decryptPKCS1v15(ciphertext, keys.privateKey);
    return plaintext;
  }

  sign({required String plaintext}) async {
    var signature =
        await RSA.signPKCS1v15(plaintext, Hash.SHA256, keys.privateKey);
    return signature;
  }

  Future<bool> verify(
      {required String signature, required String plaintext}) async {
    bool verified = await RSA.verifyPKCS1v15(
        signature, plaintext, Hash.SHA256, keys.publicKey);
    return verified;
  }
}
