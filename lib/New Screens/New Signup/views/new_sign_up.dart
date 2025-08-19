import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/button_create_account.dart';

import 'package:saken_mobile/New%20Screens/New%20Signup/widgets/custom_text_field_password.dart';
import 'package:saken_mobile/const/Routes.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/core/cache/cache_helper.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/signup_page/cubit/sign_up_cubit.dart';

class NewSignUp extends StatelessWidget {
  const NewSignUp({super.key});
  static String id = '/newSignUp';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushNamed(context, Routes.login);
        } else if (state is SignUpFaild) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorrMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 60,
                  // ),
                  const Center(
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  context.read<SignUpCubit>().photo == null
                      ? CircleAvatar(
                          radius: 55,
                          backgroundColor: kPrimaryColor,
                          child: IconButton(
                              onPressed: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => context
                                        .read<SignUpCubit>()
                                        .uploadimagepacker(value!));
                              },
                              icon: const Icon(
                                Icons.person,
                                size: 65,
                                color: Colors.white,
                              )),
                        )
                      : CircleAvatar(
                          radius: 55,
                          backgroundImage: FileImage(
                            File(context.read<SignUpCubit>().photo!.path),
                          ),
                          child: IconButton(
                              onPressed: () {
                                context.read<SignUpCubit>().removeImage();
                              },
                              icon: const Icon(Icons.remove)),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hint: "الاسم الاول",
                          controller:
                              context.read<SignUpCubit>().fNameController,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomTextField(
                          hint: "الاسم الاخير",
                          controller:
                              context.read<SignUpCubit>().lNameController,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: "البريد الالكتروني",
                    controller: context.read<SignUpCubit>().emailController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: "كلمة المرور",
                    controller: context.read<SignUpCubit>().passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: "تاكيد كلمة المرور",
                    controller:
                        context.read<SignUpCubit>().confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            context.read<SignUpCubit>().signUp();
                          },
                          child: const ButtonCreateAccount()),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('لدي حساب بالفعل.'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Login.id);
                        },
                        child: const Text(
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
      },
    );
  }
}
