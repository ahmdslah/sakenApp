import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/views/new_sign_up.dart';
import 'package:saken_mobile/const/routes.dart';
import 'package:saken_mobile/screens/Reset%20pass/views/reset_pass.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';

import '../../const/const widgets/custom_form_field.dart';
import '../../const/const.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static String id = '/login';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginnErorr) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          });
        } else if (state is LoginnSuccess) {
          Get.snackbar(
            "Success",
            'تم تسجيل الدخول بنجاح',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              child: const Text("تخطي"),
              onPressed: () {
                Navigator.popAndPushNamed(context, Routes.homeScreen);
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: font1,
                      ),
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                    CustomFormField(
                      height: height,
                      width: width,
                      hintText: "بريدك الالكتروني",
                      controller: _emailController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'من فضلك ادخل البريد الالكتروني';
                        }
                        // Regex for email validation
                        final regex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!regex.hasMatch(val)) {
                          return 'من فضلك ادخل بريد الكتروني صحيح';
                        }
                        return null;
                      },
                    ),
                    CustomFormField(
                      height: height,
                      width: width,
                      hintText: "كلمة المرور",
                      controller: _passwordController,
                      isPassword: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'من فضلك ادخل كلمة السر';
                        }
                        // Password validation
                        if (val.length < 8) {
                          return 'كلمة السر قصيرة';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        child: const Text("نسيت كلمة المرور ؟",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, ResetPass.id);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    InkWell(
                      child: Container(
                        height: height * .063,
                        width: width * .9,
                        decoration: BoxDecoration(
                          color: font1,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        BlocProvider.of<LoginCubit>(context).login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: height * .025,
                    ),
                    const Text(
                      "او التسجيل عبر ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("s");
                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("${path}facebook.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("A");
                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("${path}google.png"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .045,
                    ),
                    InkWell(
                      child: const Text(
                        "تسجيل حساب جديد",
                        style: TextStyle(
                          color: font1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.offAll(() => const NewSignUp());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
