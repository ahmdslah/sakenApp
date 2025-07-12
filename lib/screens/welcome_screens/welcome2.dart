import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/const/routes.dart';

class Welcome2 extends StatelessWidget {
  const Welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          child: Text("تخطي"),
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
            Image.asset("assets/images/welcome2.jpg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ". ",
                  style: TextStyle(fontSize: 40, color: font2),
                ),
                Text(
                  ". ",
                  style: TextStyle(fontSize: 40, color: font1),
                ),
                Text(
                  ". ",
                  style: TextStyle(fontSize: 40, color: font2),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "تطبيق ساكن يرحب بكم",
              style: TextStyle(color: font1, fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "اعرض السكن الخاصة بك",
              style: TextStyle(fontSize: 16, color: font2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
              "احصل على مستأجرين لعقارك و احصل علي عقار مناسب لك و مناسب لامكانياتك بسهولة",
            ),
            SizedBox(
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
                            context, Routes.welcome3);
                      },
                      child: Text(
                        "التالي",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: font1,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.welcome1);
                      },
                      child: Text(
                        "عودة",
                        style: TextStyle(color: font1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
