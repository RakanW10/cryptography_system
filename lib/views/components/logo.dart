import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.lock,
          size: 100,
          color: AppColors.secondray,
        ),
        Text(
          "حصين",
          style: TextStyle(
            color: AppColors.secondray,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
