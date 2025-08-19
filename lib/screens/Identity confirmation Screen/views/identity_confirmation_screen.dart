import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/core/functions/check.dart';
import 'package:saken_mobile/screens/Identity%20confirmation%20Screen/widgets/custom_identity_text_field.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/views/new_pass_screen.dart';
import 'package:saken_mobile/screens/Reset%20pass/cubit/reset_cubit.dart';
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
              const SizedBox(
                height: 25,
              ),
              const Center(
                child: Text(
                  'تاكيد الهوية',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'أدخل رمز التحقق الذي أرسلناه للتو إلى عنوان بريدك الإلكتروني.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: context.read<ResetCubit>().code,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              NextButton(
                route: NewPassScreen.id,
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
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
