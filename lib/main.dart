import 'package:cryptography_system/cryptoAlgorithms/RSA.dart';
import 'package:cryptography_system/router/routerName.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Routes.homepage,
      getPages: routerApp,
    );
  }
}

test() async {
  MyRSA o = MyRSA(keys: await MyRSA.generateKey(numberOfBits: 1024));
  print(o.keys.publicKey);
  print(o.keys.privateKey);

  String plaintext = "Rakan is going to university";

  String ciphertext = await o.encript(plaintext: plaintext);

  String d = await o.decript(ciphertext: ciphertext);

  print(d);
}
