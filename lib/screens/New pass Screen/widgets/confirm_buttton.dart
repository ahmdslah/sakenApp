import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Reset%20pass/cubit/reset_cubit.dart';
import 'package:saken_mobile/screens/Success%20Screen/views/success_screen.dart';

class ConfirmButtton extends StatelessWidget {
  const ConfirmButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GestureDetector(
        onTap: () {
          if (context.read<ResetCubit>().password.text ==
              context.read<ResetCubit>().confirmPassword.text) {
            context.read<ResetCubit>().resetPassword();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("كلمة السر غير متطابقة")));
          }
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
