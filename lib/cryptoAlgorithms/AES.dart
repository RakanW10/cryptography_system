import 'dart:math';

import 'package:encrypt/encrypt.dart';

// This class build base on https://pub.dev/packages/encrypt
class MyAES {
  static Key generateKey({required String keyString}) {
    return Key.fromUtf8(keyString);
  }

  static generateIV({required String ivString}) {
    return IV.fromUtf8(ivString);
  }

  static Encrypted encrypt({
    required String plainText,
    required Key key,
    required IV iv,
  }) {
    final encrypter = Encrypter(AES(key));
    var cipherText = encrypter.encrypt(plainText, iv: iv);
    return cipherText;
  }

  static decrypt({
    required String cipherText,
    required Key key,
    required IV iv,
  }) {
    final encrypter = Encrypter(AES(key));
    Encrypted temp = Encrypted.fromBase64(cipherText);

    return encrypter.decrypt(temp, iv: iv);
  }
}

//Start: Just to generate a random string
var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
// end

