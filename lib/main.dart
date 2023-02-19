import 'package:cryptography_system/fileUtils.dart';
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
