import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBoxBack extends StatelessWidget {
  const MainBoxBack({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.4,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: AppColors.secondrayBackgorund,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Container(
          height: Get.height * 0.4 * 0.9,
          width: Get.width * 0.4 * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0x4CFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
