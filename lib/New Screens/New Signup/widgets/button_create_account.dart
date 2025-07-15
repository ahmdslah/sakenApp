import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class ButtonCreateAccount extends StatelessWidget {
  const ButtonCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColor,
      ),
      child: const Center(
        child: Text(
          'إنشاء حساب',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
