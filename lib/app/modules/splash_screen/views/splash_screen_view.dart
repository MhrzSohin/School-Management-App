import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedOpacity(
                  opacity: controller.logoOpacity.value,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    "assets/schoollogo.jpg",
                    height: 120,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
