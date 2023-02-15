import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double height = Get.height * 0.3;
    double width = Get.width * 0.215;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFFC9CDD2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 8, color: Colors.grey),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.2,
          horizontal: width * 0.15,
        ),
        alignment: Alignment.center,
        child: Container(
          height: height * 0.8,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0x4CFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
