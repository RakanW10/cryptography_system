import 'package:cryptography_system/controllers/AESPageController.dart';
import 'package:cryptography_system/cryptoAlgorithms/AES.dart';
import 'package:cryptography_system/fileUtils.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/components/btn.dart';
import 'package:cryptography_system/views/components/keysCard.dart';
import 'package:cryptography_system/views/components/titleCard.dart';
import 'package:cryptography_system/views/components/uploadBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AESEncryptionPage extends StatelessWidget {
  AESEncryptionPage({super.key});

  final AESPageController _controller = Get.find();
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
                  const TitleCard(
                    title: 'AES',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GetBuilder<AESPageController>(builder: (context) {
                    return Row(
                      children: [
                        KeysCard(
                          title: "Key",
                          content: _controller.keyString == null
                              ? "N\\A"
                              : "${_controller.keyString!.substring(0, 15)}...",
                          icon1: Icons.file_upload_outlined,
                          onTap1: () {
                            if (_controller.keyString == null) {
                              Get.snackbar(
                                "Error",
                                "There is no key.",
                                colorText: Colors.white,
                              );
                              return;
                            }

                            writeFileAsString(
                              name: "Key.txt",
                              str: _controller.keyString!,
                            );
                          },
                          icon2: Icons.file_download_outlined,
                          onTap2: () async {
                            String? keySting = await readFile();
                            if (keySting == null) return;
                            _controller.readKey(keySting);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        KeysCard(
                          title: "IV",
                          content: _controller.ivString == null
                              ? "N\\A"
                              : "${_controller.ivString!.substring(0, 15)}...",
                          icon1: Icons.file_upload_outlined,
                          onTap1: () {
                            if (_controller.ivString == null) {
                              Get.snackbar(
                                "Error",
                                "There is no iv.",
                                colorText: Colors.white,
                              );
                              return;
                            }

                            writeFileAsString(
                              name: "IV.txt",
                              str: _controller.ivString!,
                            );
                          },
                          icon2: Icons.file_download_outlined,
                          onTap2: () async {
                            String? file = await readFile();
                            if (file == null) return;
                            _controller.readIv(file);
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
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: Get.height * 0.65 * 0.55,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC9CDD2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.65 * 0.55,
                          width: Get.width * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0x4CFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Encryption",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.65 * 0.55,
                          width: Get.width * 0.65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              GetBuilder<AESPageController>(builder: (_) {
                                return UploadBox(
                                    statusTitle: _controller.file1StatusTitle,
                                    onTap: () {
                                      _controller.readFile1();
                                    });
                              }),
                              const SizedBox(
                                height: 8,
                              ),
                              btn(
                                title: "Encrypt & Download",
                                onTap: () async {
                                  if (_controller.file1 == null ||
                                      _controller.key == null ||
                                      _controller.iv == null) {
                                    Get.snackbar(
                                      "Error",
                                      "The is no file or key or iv .",
                                      colorText: Colors.white,
                                    );
                                    return;
                                  }
                                  var before = DateTime.now();
                                  var ciphertext = MyAES.encrypt(
                                    key: _controller.key!,
                                    iv: _controller.iv!,
                                    plainText: _controller.file1!,
                                  );
                                  var dif = DateTime.now().difference(before);
                                  print("======== $dif ========");
                                  writeFile(
                                    name: "ciphertext.txt",
                                    str: ciphertext.bytes,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
