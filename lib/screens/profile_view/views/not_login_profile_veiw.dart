import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/views/new_sign_up.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/const/routes.dart';
import 'package:saken_mobile/screens/login_page/login.dart';

class NotLoginProfileVeiw extends StatelessWidget {
  const NotLoginProfileVeiw({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Not Login")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: font1,
                  width: 2,
                ),
              ),
              onPressed: () {
                Get.offAll(() => Login());
              },
              child: const Text(
                "تسجيل دخول",
                style: TextStyle(color: font1),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(font1),
              ),
              onPressed: () {
                Get.offAll(() => NewSignUp());
              },
              child: const Text(
                "انشاء حساب",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
