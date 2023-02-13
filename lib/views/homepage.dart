import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/components/MainBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgorund,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/Logo.png",
                ),
                Text(
                  "Cryptography System",
                  style: TextStyle(
                    fontSize: 100,
                    color: AppColors.secondray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.1,
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MainBox(
                  title: 'RSA',
                  onTap: null,
                ),
                MainBox(
                  title: "ACE",
                  onTap: null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
