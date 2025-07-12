import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/const/routes.dart';

class Policy extends StatefulWidget {
  Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            Text(
              "سياسة الخصوصية و الامان",
              style: TextStyle(
                  color: font1, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "تطبيق ساكن مجرد منصة تسهل الوصول لسكن بسعر مناسب ولا تشرف على المعاملات بين المستخدمين على التطبيق وبعضهم البعض لذا فهي ليست مسئولة عن أي عمليات نصب أو احتيال من أي من المستخدمين على التطبيق "
              "ولكن بمجرد التأكد من أي مستخدم ثبت عليه عملية نصب أو احتيال فسوف يتم حظره من التطبيق على الفور."
              "\n"
              "\n"
              "يتم استخدام بياناتك في ترشيح لك السكن الذي مواصفاته أقرب لمواصفات السكن الذي تبحث عنه و ترشيح لك نوعية المستخدمين الذين تفضل التعامل معهم ويظهر ذلك السكن وتلك المستخدمين في صفحة الترشيحات وفي الإشعارات لذا فإنه كلما ملئت بيانات أكثر عن نفسك وعن السكن الذي تبحث عنه وعن نوعية المستخدمين الذين تفضل التعامل معهم سواء كانو مأجرين أو مستأجرين كلما ساعدنا ذلك في عرض الترشيحات الأنسب لك"
              "\n"
              "\n"
              "شركة ساكن لا تأخذ أي عمولة من المأجرين أو المستأجرين إلا على السكن الذي تكون هي فقط المأجر له."
              "\n"
              "\n"
              "نحن نهتم بخصوصيتك ونلتزم بحماية بياناتك الشخصية."
              "\n"
              "\n"
              "من خلال استخدامك لهذا التطبيق، فإنك توافق على جمع واستخدام البيانات كما هو موضح في هذه السياسة.",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = value ?? false;
                    print(isChecked);
                    setState(() {});
                  },
                ),
                Text(
                  "لقد قرات سياسة الخصوصيه والامان واوافق عليها",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: isChecked
                                  ? WidgetStateProperty.all(font1)
                                  : WidgetStateProperty.all(Colors.white30)),
                          onPressed: () {
                            if (isChecked) {
                              Navigator.pushReplacementNamed(
                                  context, Routes.welcome1);
                            }
                          },
                          child: Text(
                            "موافق",
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
