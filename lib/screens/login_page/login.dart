import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const%20widgets/DialogUtils.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';

import '../../const/const widgets/custom_form_field.dart';
import '../../const/const.dart';
import 'package:get/get.dart';

import '../signup_page/sign_up.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginFaild) {
          isloading = false;
          Get.snackbar("Login Faild", state.errMessage);
        } else if (state is LoginSuccess) {
          isloading = false;
          Get.offAll(HomeScreen());
        }
      },
      builder: (context, state) {
        if (isloading) {
          return DialogUtils.showLoadingDialog(context);
        } else {
          return Scaffold(
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
                        Image.asset(
                          "${path}logo.png",
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "ساكن ",
                              style: TextStyle(
                                fontSize: 26,
                                color: font2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "اهلا بك في تطبيق",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .025,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: font1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .017,
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        InkWell(
                          child: Container(
                            height: height * .073,
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
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<LoginCubit>(context).signIn(
                                context: context,
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
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("${path}facebook.png"),
                            ),
                            GestureDetector(
                              onTap: () async {},
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage("${path}google.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .025,
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
                            Get.to(SignUp());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
