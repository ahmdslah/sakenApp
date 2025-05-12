import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';

import '../const.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isName;
  final bool isphone;
  final bool search;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.isName = false,
    this.isphone=false,
    this.search=false,

  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomFormCubit>();
    return SizedBox(
      height: height * .11,
      width: width, // Set desired width
      child: BlocBuilder<CustomFormCubit, CustomFormState>(
        builder: (context, state) {
          bool isObstruct = cubit.getObstruct();
          return TextFormField(
            obscureText: isPassword && isObstruct ? true : false,
            validator: validator,
            controller: controller,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 16,
                locale: Locale('ar'), // Ensures Arabic text rendering
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: const TextStyle(fontSize: 15),
              prefixIcon: Icon(
                isPassword
                    ? Icons.lock
                    : isName
                    ? Icons.person_outline:
                isphone?Icons.edit:search?null:
                Icons.email_outlined,
                color: font1,
              ),
              suffixIcon: InkWell(
                child: Icon(
                  isPassword
                      ? isObstruct
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash
                      : null,
                  color: font1,
                ),
                onTap: () {
                  cubit.showOrHidePassword();
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: font1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
