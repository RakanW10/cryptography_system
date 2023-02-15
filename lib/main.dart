import 'dart:io';

import 'package:cryptography_system/router/routerName.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

test() async {
  var x = File("cryptography_system/lib");
  x.create();
}
