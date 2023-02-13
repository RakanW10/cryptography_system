import 'package:cryptography_system/controllers/homepageController.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/components/mainBox.dart';
import 'package:cryptography_system/views/components/mainBoxBack.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomepageController _homepageController = Get.put(HomepageController());

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
              children: [
                Image.asset(
                  "assets/images/Logo.png",
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlipCard(
                    controller: _homepageController.cardController1,
                    front: MainBox(
                      title: 'RSA',
                      onTap: () {
                        print("object");
                      },
                      onHover: (p0) {
                        print(p0);
                        if (p0) {
                          _homepageController.cardController1.toggleCard();
                        }
                      },
                    ),
                    back: MainBoxBack(
                      title: "RSA",
                      description:
                          "RSA is a popular public key cryptography algorithm that uses prime factorization for secure data transmission. It has two keys, a public key for encryption and a private key for decryption, ensuring that only the intended recipient can access the encrypted information. RSA is widely used in digital signatures, software protection, and secure communication protocols.",
                      onTap: () {
                        print("object");
                      },
                    ),
                  ),
                  FlipCard(
                    controller: _homepageController.cardController2,
                    front: MainBox(
                      title: 'AES',
                      onTap: () {},
                      onHover: (p0) {
                        if (p0) {
                          _homepageController.cardController2.toggleCard();
                        }
                      },
                    ),
                    back: MainBoxBack(
                      onTap: () {},
                      title: 'AES',
                      description:
                          "AES (Advanced Encryption Standard) is a widely used symmetric key encryption algorithm. It uses a fixed block size of 128 bits and supports key sizes of 128, 192, and 256 bits. AES operates on a fixed number of rounds, depending on the key size. It is fast and secure, making it suitable for a variety of applications, including encrypted data storage, secure internet communications, and more.",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
