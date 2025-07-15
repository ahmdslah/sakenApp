import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/button_create_account.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_confirm_password.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_email.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_f_name.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_l_name.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_password.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/login_page/login.dart';

class NewSignUp extends StatelessWidget {
  const NewSignUp({super.key});
  static String id = '/newSignUp';
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
                height: 20,
              ),
              Center(
                child: Text(
                  'إنشاء حساب',
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
              Row(
                children: [
                  Expanded(child: CustomTextFieldFName()),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: CustomTextFieldLName())
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFieldEmail(),
              SizedBox(
                height: 30,
              ),
              CustomTextFieldPassword(),
              SizedBox(
                height: 30,
              ),
              CustomTextFieldConfirmPassword(),
              SizedBox(
                height: 30,
              ),
              ButtonCreateAccount(),
              SizedBox(
                height: 30,
              ),
              Text('تسجيل دخول ب'),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("${path}facebook.png"),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("${path}google.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('لدي حساب بالفعل.'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    child: Text(
                      ' تسجيل دخول',
                      style: TextStyle(
                        color: Color(0xffFFA500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
