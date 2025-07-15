import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/login_page/login.dart';

class SuccessButton extends StatelessWidget {
  const SuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Login.id,
            (route) => false,
          );
        },
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kPrimaryColor,
          ),
          child: const Center(
            child: Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
