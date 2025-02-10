import 'package:flutter/material.dart';

import '../../const/const.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${path}logo.png",
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ساكن ",
                  style: TextStyle(
                    fontSize: 26,
                    color: font2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "اهلا بك في تطبيق",
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .025,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: font1,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              height: height * .065,
              width: width, // Set desired width
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "ادخل البريد الالكتروني",
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(fontSize: 24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
