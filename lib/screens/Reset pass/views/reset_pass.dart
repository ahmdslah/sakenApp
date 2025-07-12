import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Identity%20confirmation%20Screen/views/identity_confirmation_screen.dart';
import 'package:saken_mobile/screens/Reset%20pass/widgets/next_button.dart';
import 'package:saken_mobile/screens/Reset%20pass/widgets/text_field_reset_pass.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  'نسيت كلمة المرور',
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
                'لا تقلق! هذا يحدث. يُرجى إدخال عنوان البريد الإلكتروني المرتبط بحسابك.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFieldResetPass(),
              NextButton(route: IdentityConfirmationScreen.id,),
            ],
          ),
        ),
      ),
    );
  }
}
