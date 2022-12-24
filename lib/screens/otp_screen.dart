import 'dart:convert';
import 'package:food_app/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;

class OTPScreen extends StatefulWidget {
  final int? user_id;
  OTPScreen({super.key, this.user_id});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? OTP;
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
        centerTitle: true,
        backgroundColor: BG_COLOR,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Your code sent to: ***********',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: FixedColorBuilder(
                    Colors.black,
                  ),
                ),
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  OTP = code;
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
            ),
            SizedBox(height: 28),
            loader
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : InkWell(
                    onTap: () {
                      setState(() {
                        if (OTP!.isEmpty) {
                        } else {
                          verification();
                        }
                      });
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
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future verification() async {
    http.Response response = await http.post(
      Uri.parse("https://bdraj.com/api/v2/auth/confirm_code"),
      headers: {"Accepts": "application/json"},
      body: {
        "user_id": "${widget.user_id}",
        "verification_code": "${OTP}",
      },
    );
    if (response.statusCode == 200) {
      try {
        setState(() {
          loader = true;
        });
        var result = jsonDecode(response.body);
        if (result["result"] == false) {
          Get.snackbar("", result["message"]);

          setState(() {
            loader = false;
          });
        } else {
          Get.snackbar("", result["message"],
              snackPosition: SnackPosition.BOTTOM);

          setState(() {
            loader = false;
          });
        }
      } catch (ex) {
        print("The error is: $ex");
      }
    } else {
      loader = false;
    }
  }
}
