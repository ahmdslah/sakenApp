import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Success%20Screen/views/success_screen.dart';

class ConfirmButtton extends StatelessWidget {
  const ConfirmButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SuccessScreen.id);
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
              'تاكيد',
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
