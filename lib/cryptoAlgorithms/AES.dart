import 'dart:math';

import 'package:encrypt/encrypt.dart';

// This class build base on https://pub.dev/packages/encrypt
class MyAES {
  String? ivString;
  IV? iv;
  String? keyString;
  Key? key;

  generateKey({String? keytext}) {
    if (keytext != null) {
      if (keytext.length != 32)
        throw "the lenght of the keytext should equal 16";
      keyString = keytext;
      key = Key.fromUtf8(keytext);
    } else {
      keyString = getRandomString(32);
      key = Key.fromUtf8(keyString!);
    }
  }

  generateIV({String? ivtext}) {
    if (ivtext != null) {
      if (ivtext.length != 16) throw "the lenght of the ivtext should equal 16";
      ivString = ivtext;
      iv = IV.fromUtf8(ivtext);
    } else {
      ivString = getRandomString(16);
      iv = IV.fromUtf8(ivString!);
    }
  }

  // will return the ciphertext  version and the iv
  Encrypted encrypt({required String plainText}) {
    if (key == null) throw ("there is no key, Initialzate it first");
    if (iv == null) throw ("there is no iv, Initialzate it first");

    final encrypter = Encrypter(AES(key!));
    var cipherText = encrypter.encrypt(plainText, iv: iv);
    return cipherText;
  }

  decrypt({required Encrypted cipherText}) {
    if (key == null) throw ("there is no key, Initialzate it first");
    if (iv == null) throw ("there is no iv, Initialzate it first");

    final encrypter = Encrypter(AES(key!));
    return encrypter.decrypt(cipherText, iv: iv);
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

