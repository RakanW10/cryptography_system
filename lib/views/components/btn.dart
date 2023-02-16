import 'package:flutter/material.dart';
import 'package:get/get.dart';

class btn extends StatelessWidget {
  const btn({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, 80),
        backgroundColor: const Color(0xFF315685),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
