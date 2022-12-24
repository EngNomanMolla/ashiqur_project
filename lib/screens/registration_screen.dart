import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:food_app/model/registration_model.dart';
import 'package:food_app/screens/otp_screen.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/static_text.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:food_app/model/registration_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationModel? _registrationModel;
  bool loader = false;
  String? registerBy;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(REGISTRATIONTEXT),
        centerTitle: true,
        backgroundColor: BG_COLOR,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Name',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email or phone';
                        }
                      },
                      controller: emailOrPhone,
                      decoration: InputDecoration(
                        hintText: 'Email or Phone number',
                        labelText: 'Email or Phone number',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your password";
                        }
                      },
                      controller: password,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Confirm password";
                        }
                      },
                      controller: confirmPassword,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        labelText: 'Confirm password',
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                loader
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.indigo,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          if (key.currentState!.validate()) {
                            register();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, right: 28),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 45,
                            width: double.infinity,
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<RegistrationModel?> register() async {
    setState(() {
      loader = true;
    });

    if (emailOrPhone.text.contains('@')) {
      registerBy = 'email';
    } else {
      registerBy = 'phone';
    }

    var body = {
      'name': '${nameController.text}',
      'email_or_phone': '${emailOrPhone.text}',
      'password': '${password.text}',
      'password_confirmation': '${confirmPassword.text}',
      'register_by': '${registerBy}',
    };
    // print('Body---$body');

    http.Response response = await http.post(
      Uri.parse("https://bdraj.com/api/v2/auth/signup"),
      body: body,
      headers: {"Accept": "application/json"},
    );
    _registrationModel = registrationModelFromJson(response.body);

    if (response.statusCode == 201) {
      if (_registrationModel!.result == false) {
        Get.snackbar("", _registrationModel!.message.toString());

        setState(() {
          loader = false;
        });
      } else {
        setState(() {
          loader = false;
          Get.snackbar("", _registrationModel!.message.toString());
          Get.to(OTPScreen(
            user_id: _registrationModel!.userId,
          ));
          //  print("response__${response.body}");
          // print('User_ID: ${_registrationModel!.userId}');
        });
      }
    } else {
      setState(() {
        loader = false;
      });
    }
    return _registrationModel;
  }
}
