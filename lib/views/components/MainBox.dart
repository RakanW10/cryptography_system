import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBox extends StatelessWidget {
  const MainBox({super.key, required this.title, required this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.1,
          vertical: Get.height * 0.1,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondrayBackgorund,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.05,
          ),
          decoration: BoxDecoration(
            color: const Color(0x4CFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: TextStyle(color: AppColors.primary, fontSize: 96),
          ),
        ),
      ),
    );
  }
}
