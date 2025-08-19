import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/confirm_buttton.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/custom_confirm_pass_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/custom_new_pass_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/widgets/instructions.dart';
import 'package:saken_mobile/screens/Reset%20pass/cubit/reset_cubit.dart';
import 'package:saken_mobile/screens/Success%20Screen/views/success_screen.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});
  static String id = '/newPassScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetState>(
      listener: (context, state) {
        if (state is ResetSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushNamed(context, SuccessScreen.id);
        } else if (state is ResetFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 25),
                  const Align(
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
                  const SizedBox(
                    height: 55,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      'يجب أن تكون كلمة المرور الجديدة الخاصة بك قوية و مختلفة عن تلك التي استخدمتها سابقًا.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Instructions(
                    text: 'إنشاء كلمات مرور قوية',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 4,
                        width: 4,
                        color: Colors.black,
                      ),
                      const Instructions(text: '  طول 12 حرفا على الأقل'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 4,
                        width: 4,
                        color: Colors.black,
                      ),
                      const Instructions(
                          text:
                              '  مزيج من الأحرف الكبيرة والأحرف الصغيرة والأرقام والرموز.'),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomNewPassTextField(),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomConfirmPassTextField(),
                  state is ResetLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const ConfirmButtton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
