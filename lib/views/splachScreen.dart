import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(""))),
      ),
    );
  }
}
