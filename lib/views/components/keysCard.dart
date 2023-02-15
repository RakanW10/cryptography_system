import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeysCard extends StatelessWidget {
  const KeysCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon1,
    required this.onTap1,
    required this.icon2,
    required this.onTap2,
  });
  final String title;
  final String content;
  final IconData icon1;
  final Function()? onTap1;
  final IconData icon2;
  final Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: const Color(0x4CFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "$title: $content",
                style: TextStyle(color: AppColors.primary, fontSize: 40),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: onTap1,
                    icon: Icon(
                      icon1,
                      color: AppColors.primary,
                    )),
                IconButton(
                    onPressed: onTap2,
                    icon: Icon(
                      icon2,
                      color: AppColors.primary,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
