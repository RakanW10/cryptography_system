import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/components/keysCard.dart';
import 'package:cryptography_system/views/components/mainBox.dart';
import 'package:cryptography_system/views/components/serviceBox.dart';
import 'package:cryptography_system/views/components/titleCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RSAPage extends StatelessWidget {
  const RSAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgorund,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.offAllNamed(Routes.homepage),
                  child: Image.asset(
                    "assets/images/Logo.png",
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "Cryptography System",
                  style: TextStyle(
                    fontSize: 100,
                    color: AppColors.secondray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: Get.height * 0.65,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.secondrayBackgorund,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 38, horizontal: 38),
              child: Column(
                children: [
                  const TitleCard(),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      KeysCard(
                        title: "Public key",
                        content: "123453223432",
                        icon1: Icons.file_upload_outlined,
                        onTap1: null,
                        icon2: Icons.file_download_outlined,
                        onTap2: null,
                      ),
                      KeysCard(
                        title: "Private key",
                        content: "N\\A",
                        icon1: Icons.remove_red_eye,
                        onTap1: null,
                        icon2: Icons.file_download_outlined,
                        onTap2: null,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ServiceBox(
                        title: "Signing",
                        onTap: null,
                      ),
                      ServiceBox(
                        title: "Verifying",
                        onTap: null,
                      ),
                      ServiceBox(
                        title: "Encryption",
                        onTap: null,
                      ),
                      ServiceBox(
                        title: "Decryption",
                        onTap: null,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
