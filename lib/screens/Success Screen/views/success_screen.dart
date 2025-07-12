import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Success%20Screen/widgets/success_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  static String id = '/successScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/success.png'),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'تم تغيير كلمة المرور بنجاح',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
            SuccessButton(),
          ],
        ),
      ),
    );
  }
}
