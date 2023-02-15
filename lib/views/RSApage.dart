import 'dart:io';

import 'package:cryptography_system/controllers/RSApageController.dart';
import 'package:cryptography_system/fileUtils.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/components/keysCard.dart';
import 'package:cryptography_system/views/components/serviceBox.dart';
import 'package:cryptography_system/views/components/titleCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RSAPage extends StatelessWidget {
  RSAPage({super.key});

  final RSApageController _controller = Get.find();
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
              height: 8,
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
                  GetBuilder<RSApageController>(builder: (context) {
                    return Row(
                      children: [
                        KeysCard(
                          title: "Public key",
                          content: _controller.publicKey == null
                              ? "N\\A"
                              : "${extractKey(key: _controller.publicKey!, public: true)}...",
                          icon1: Icons.file_upload_outlined,
                          onTap1: null,
                          icon2: Icons.file_download_outlined,
                          onTap2: () {
                            _controller.readPublicKey();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        KeysCard(
                          title: "Private key",
                          content: _controller.privateKey == null
                              ? "N\\A"
                              : "${extractKey(key: _controller.privateKey!, public: false)}...",
                          icon1: Icons.remove_red_eye,
                          onTap1: null,
                          icon2: Icons.file_download_outlined,
                          onTap2: () {
                            _controller.readPrivateKey();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.03,
                          decoration: BoxDecoration(
                              color: const Color(0xFFC9CDD2),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.grey,
                                )
                              ]),
                          child: IconButton(
                            icon: Icon(
                              Icons.vpn_key_rounded,
                              color: AppColors.primary,
                            ),
                            onPressed: () async {
                              await _controller.generateKey();
                              writeCounter("test");
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
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

extractKey({required String key, required bool public}) {
  if (public) {
    return key
        .replaceAll(RegExp("-----BEGIN RSA PUBLIC KEY-----"), "")
        .replaceAll(RegExp("-----END RSA PUBLIC KEY-----"), "")
        .substring(1, 15);
  } else {
    return key
        .replaceAll(RegExp("-----BEGIN RSA PRIVATE KEY-----"), "")
        .replaceAll(RegExp("-----END RSA PRIVATE KEY-----"), "")
        .substring(1, 15);
    ;
  }
}
