import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const%20widgets/DialogUtils.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/profile_screen/edit_info/edit_info.dart';

import '../../const/const widgets/custom_form_field.dart';
import '../../const/const.dart';
import 'package:get/get.dart';

import '../../saken_cubit/form_cubit/custom_form_cubit.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                  const Text(
                    "سجل حساب جديد",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * .025,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تسجيل حساب",
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
                    isName: true,
                    hintText: "اسمك",
                    controller: _nameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'من فضلك ادخل اسمك';
                      }
                      return null;
                    },
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
                      Signup();
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("${path}facebook.png"),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("${path}google.png"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "عندك حساب ؟",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          "سجل دخولك",
                          style: TextStyle(
                            color: font1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.to(Login());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   Signup()async{
     DialogUtils.showLoadingDialog(context);
    if(formKey.currentState!.validate()){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password:_passwordController.text
        );
        Navigator.pop(context);
        Get.offAll(HomeScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          DialogUtils.showmessagedialog(context: context,
              text: 'user-not-found', posbtntxt: "Ok",
              posbtnclk:(){
                Navigator.pop(context); });
        } else if (e.code == 'wrong-password') {
          DialogUtils.showmessagedialog(context: context,
              text:'Wrong password provided for that user.' , posbtntxt: "Ok",
              posbtnclk:(){
                Navigator.pop(context);
              });
          print('Wrong password provided for that user.');
        }
      }
      catch (e) {
        print(e);}
    }

  }
}
/*try {
        DialogUtils.showLoadingDialog(context);
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text
        );
        Navigator.pop(context);
        Get.offAll(HomeScreen());



      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print(e);
          DialogUtils.showmessagedialog(context: context,
              text: 'user-not-found', posbtntxt: "Ok",
              posbtnclk:(){
                Navigator.pop(context);
              });
        } else if (e.code == 'wrong-password') {
          DialogUtils.showmessagedialog(context: context,
              text:'Wrong password provided for that user.' , posbtntxt: "Ok",
              posbtnclk:(){
                Navigator.pop(context);
              });
        }

      }
      catch (e) {
        print(e);}*/