import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/cubit/profile_edit_cubit.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final String fieldKey;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.fieldKey,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditCubit, ProfileEditState>(
      builder: (context, state) {
        final cubit = context.read<ProfileEditCubit>();
        bool isObscured = cubit.getObstruct(fieldKey);

        return TextField(
          obscureText: isPassword && isObscured,
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? InkWell(
                    onTap: () {
                      cubit.toggleObstruct(fieldKey);
                    },
                    child: Icon(
                      isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                      color: font1,
                    ),
                  )
                : null,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 18, color: Color(0xff828282)),
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
