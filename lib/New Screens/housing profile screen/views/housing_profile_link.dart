import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class HousingProfileLink extends StatelessWidget {
  const HousingProfileLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: kPrimaryColor,
        ),
        child: const Center(
          child: Text(
            'نسخ الرابط',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
