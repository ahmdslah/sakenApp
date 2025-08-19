import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/const/routes.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

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
            Image.asset("assets/images/welcome1.jpg"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ". ",
                  style: TextStyle(fontSize: 40, color: font1),
                ),
                Text(
                  "ــ",
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
              "اعثر علي سكن مناسب",
              style: TextStyle(fontSize: 16, color: font2),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
                "قم بالتصفية حسب الأثاث والموقع و نوع الكسن مفروش ام لا والسعر وتواصل مع المؤجر بشكل مباشر!"),
            const SizedBox(
              height: 50,
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
                            Navigator.pushReplacementNamed(
                                context, Routes.welcome2);
                          },
                          child: const Text(
                            "التالي",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
