import 'package:cryptography_system/cryptoAlgorithms/AES.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:encrypt/encrypt.dart' as e;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    test();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Routes.homepage,
      getPages: routerApp,
    );
  }
}

test() {
  final plainText = 'Rakan is going to university';
  // var o = MyAES();
  // o.generateKey(keytext: "asdffdsaasdffdsaasdffdsaasdffdsa");

  // o.generateIV(ivtext: "asdffdsaasdffdsa");
  // print(o.ivString);
  // print(o.iv!.base64);

  // print(o.keyString);
  // print(o.key!.base64);
  // print("=" * 100);

  // var cipher = o.encrypt(plainText: plainText);
  // print(cipher.base64);
  // print(o.decrypt(cipherText: cipher));
}
