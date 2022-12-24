import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:food_app/local/share_prefab.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/registration_screen.dart';
import 'package:food_app/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email_or_phone = TextEditingController();
  final password = TextEditingController();
  final key = GlobalKey<FormState>();
  bool loader = false;
  bool isSelected = false;

  // Future getFunction() async {
  //   if (SharedPrefab().getRemember() == true) {
  //     email_or_phone.text = SharedPrefab().getEmailOrPhone() ?? "01742375923";
  //     password.text = SharedPrefab().getPassword()  ?? "123456";
  //   } else {
  //     isSelected = false;
  //   }
  // }

  @override
  void initState() {
   // getFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: BG_COLOR,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: key,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 29, top: 28),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: TextFormField(
                    controller: email_or_phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email or phone number";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email or phone number",
                      labelText: "Email of phone number",
                      contentPadding: EdgeInsets.only(left: 28.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 29, top: 20),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      contentPadding: EdgeInsets.only(left: 28.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 28,
                  ),
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                      });
                    },
                    activeColor: Colors.indigo,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              loader
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : isSelected == true
                      ? InkWell(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              LogIn();
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 28.0, right: 28.0),
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              LogIn();
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 28.0, right: 28.0),
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(RegistrationScreen());
                },
                child: Center(
                  child: Text(
                    "Don't have an account? Create Account",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future LogIn() async {
    var _body = {
      "emailOrPhone": "${email_or_phone.text}",
      "password": "${password.text}",
    };
    try {
      http
          .post(
        Uri.parse("https://bdraj.com/api/v2/auth/login"),
        headers: {"Accepts": "application/json"},
        body: _body,
      )
          .then((value) {
        var responseBody = jsonDecode(value.body);

        print("responseBody____${responseBody}");

        if (responseBody["result"] == true) {
          Get.snackbar(
            "",
            "${responseBody["message"]}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.indigo,
            colorText: Colors.white,
            //borderColor: Colors.amber,
          );

          SharedPrefab().setAuthToken(responseBody['access_token']);
          SharedPrefab().setEmailOrPhone(email_or_phone.text);
          SharedPrefab().setPassword(password.text);
          SharedPrefab().setRemember(isSelected);

          Get.to(HomeScreen());
          print("success");
        } else {
          Get.snackbar(
            "",
            "${responseBody["message"]}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.indigo,
            colorText: Colors.white,
            //borderColor: Colors.red,
          );
          print("unsucessfull");
        }
      });
    } catch (ex) {
      print(ex);
    }
  }
}
