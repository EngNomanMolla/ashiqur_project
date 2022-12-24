import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/registration_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 5), () {
      
      Get.offAll(LoginScreen());
    });
    super.onReady();
  }
}
