import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/signup_page/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "${path}logo.png",
          ),
          SizedBox(
            height: height * .01,
          ),
          const Text(
            "سجل الأن",
            style: TextStyle(
              color: font1,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          buildContainer(width, height, text: "تسجيل الدخول"),
          SizedBox(
            height: height * .025,
          ),
          buildContainer(width, height, text: "انشاء الحساب"),
        ],
      ),
    );
  }

  Widget buildContainer(
    double width,
    double height, {
    required String text,
  }) {
    return InkWell(
      child: Container(
        width: width * .75,
        height: height * .08,
        decoration: BoxDecoration(
          color: text == "تسجيل الدخول" ? font1 : Colors.white,
          border: text == "تسجيل الدخول" ? null : Border.all(color: font1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: text == "تسجيل الدخول" ? Colors.white : font1,
              fontSize: 28,
            ),
          ),
        ),
      ),
      onTap: () {
        text == "تسجيل الدخول" ? Get.offAll(Login()) : Get.offAll(SignUp());
      },
    );
  }
}
