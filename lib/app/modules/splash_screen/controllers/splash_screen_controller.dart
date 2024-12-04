import 'package:get/get.dart';
import 'package:school_management_ui/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  var logoOpacity = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    startAnimation();
    naviagateToHome();
  }

  @override
  void startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      logoOpacity.value = 1.0;
    });
  }

  @override
  void naviagateToHome() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.HOME);
  }
}
