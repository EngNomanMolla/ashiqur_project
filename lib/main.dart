import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_controller.dart';
import 'package:food_app/local/share_prefab.dart';
import 'package:food_app/network/product_service.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/otp_screen.dart';
import 'package:food_app/screens/registration_screen.dart';
import 'package:food_app/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:food_app/screens/registration_screen.dart';
import 'package:food_app/model/registration_model.dart';

Future<void> main() async {
  await SharedPrefab().InitSharedPrefab();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginScreen(),
    );
  }
}
