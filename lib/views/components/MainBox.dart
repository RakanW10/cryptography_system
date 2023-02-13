import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBox extends StatelessWidget {
  const MainBox({
    super.key,
    required this.title,
    required this.onTap,
    required this.onHover,
  });
  final String title;
  final Function()? onTap;
  final Function(bool)? onHover;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: onTap,
      child: Container(
        height: Get.height * 0.4,
        width: Get.width * 0.4,
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.height * 0.05,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondrayBackgorund,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Container(
          height: Get.height * 0.4 * 0.8,
          width: Get.width * 0.4 * 0.8,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.05,
          ),
          decoration: BoxDecoration(
            color: const Color(0x4CFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: AppColors.primary, fontSize: 96),
          ),
        ),
      ),
    );
  }
}
