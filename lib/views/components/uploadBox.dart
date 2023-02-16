import 'package:cryptography_system/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadBox extends StatelessWidget {
  const UploadBox({
    super.key,
    required this.onTap,
    required this.statusTitle,
    this.isHalf = false,
    this.subTitle,
  });
  final Function()? onTap;
  final String statusTitle;
  final bool isHalf;
  final String? subTitle;
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
          width: isHalf ? Get.width * 0.65 / 2.2 : Get.width * 0.65,
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
              subTitle != null
                  ? Text(
                      subTitle!,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
