import 'package:flutter/material.dart';
import 'package:food_app/controllers/splash_controller.dart';
import 'package:food_app/utils/local_assets_images.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage(Splash_Image),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
