import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Reset%20pass/cubit/reset_cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.route,
  });
  final String route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 160),
      child: GestureDetector(
        onTap: () {
          if (context.read<ResetCubit>().code.text.length == 8) {
            Navigator.pushNamed(context, route);
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
              'التالي',
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
