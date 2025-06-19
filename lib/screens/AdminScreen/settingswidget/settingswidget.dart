import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/const/const%20widgets/Custom_btn.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/masken/masken.dart';
import 'package:saken_mobile/screens/AdminScreen/Adminscreen.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Settings",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: font1),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomBtn("Check In/Out Guests", isinout: true, function: () {
            Get.to(AdminScreen());
          }),
          const SizedBox(
            height: 50,
          ),
          CustomBtn("Admin Options", isadmin: true, function: () {
            Get.to( ApartmentsScreen());
          }),
          const SizedBox(
            height: 50,
          ),
          CustomBtn("Settings", issetting: true, function: () {
            Get.to(AdminScreen());
          })
        ],
      ),
    );
  }
}
