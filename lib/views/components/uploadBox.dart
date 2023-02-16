import 'package:cryptography_system/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadBox extends StatelessWidget {
  const UploadBox({super.key, required this.onTap, required this.statusTitle});
  final Function()? onTap;
  final String statusTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: AppColors.primary,
        strokeWidth: 2,
        dashPattern: const [8, 8],
        child: Container(
          height: Get.height * 0.65 * 0.4,
          width: Get.width * 0.65,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/file-upload-export-icon 1.svg",
              ),
              Text(
                statusTitle,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
