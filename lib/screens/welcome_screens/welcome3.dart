import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/views/new_sign_up.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/const/routes.dart';

class Welcome3 extends StatelessWidget {
  const Welcome3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          child: const Text("تخطي"),
          onPressed: () {
            Navigator.popAndPushNamed(context, Routes.login);
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/welcome3.png"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ــ",
                  style: TextStyle(fontSize: 40, color: font1),
                ),
                Text(
                  " .",
                  style: TextStyle(fontSize: 40, color: font2),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "تطبيق ساكن يرحب بكم",
              style: TextStyle(color: font1, fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "تفقد  بسهولة انواع السكن المعروض حسب اهتماماتك و تواصل مع المالك و المستأجرين  ",
              style: TextStyle(fontSize: 16, color: font2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
              "انت علي بعد خطوات لتعثر علي سكن مناسب عبر التواصل مع المؤجر",
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(font1),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, NewSignUp.id);
                      },
                      child: const Text(
                        "انشاء حساب",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: font1,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: const Text(
                        "تسجيل دخول",
                        style: TextStyle(color: font1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.homeScreen);
                },
                child: const Text(
                  "تصفح الشقق المعروضة",
                  style: TextStyle(color: font2),
                ))
          ],
        ),
      ),
    );
  }
}
