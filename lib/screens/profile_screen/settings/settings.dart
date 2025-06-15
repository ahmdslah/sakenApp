import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/Custom_Row.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "الاعدادات ",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اعدادات الحساب",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/Image AR.png",
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Custom_Row("استقبال الرسائل "),
              const SizedBox(
                height: 30,
              ),
              Custom_Row("استقبال الاشعارات على email "),
            ],
          ),
        ),
      ),
    );
  }
}
