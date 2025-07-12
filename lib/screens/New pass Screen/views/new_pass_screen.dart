import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/confirm_buttton.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/custom_confirm_pass_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/custom_new_pass_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/instructions.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});
  static String id = '/newPassScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'انشاء كلمة سر جديدة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  'يجب أن تكون كلمة المرور الجديدة الخاصة بك قوية و مختلفة عن تلك التي استخدمتها سابقًا.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Instructions(
                text: 'إنشاء كلمات مرور قوية',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    color: Colors.black,
                  ),
                  Instructions(text: '  طول 12 حرفا على الأقل'),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    color: Colors.black,
                  ),
                  Instructions(
                      text:
                          '  مزيج من الأحرف الكبيرة والأحرف الصغيرة والأرقام والرموز.'),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomNewPassTextField(),
              SizedBox(
                height: 30,
              ),
              CustomConfirmPassTextField(),
              ConfirmButtton(),
            ],
          ),
        ),
      ),
    );
  }
}
