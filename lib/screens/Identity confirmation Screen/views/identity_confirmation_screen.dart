import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Identity%20confirmation%20Screen/widgets/custom_identity_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/views/new_pass_screen.dart';
import 'package:saken_mobile/screens/Reset%20pass/widgets/next_button.dart';

class IdentityConfirmationScreen extends StatelessWidget {
  const IdentityConfirmationScreen({super.key});
  static String id = '/identityConfirmation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  'تاكيد الهوية',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'أدخل رمز التحقق الذي أرسلناه للتو إلى عنوان بريدك الإلكتروني.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              CustomIdentityTextField(),
              NextButton(
                route: NewPassScreen.id,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'اعادة الارسال',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
