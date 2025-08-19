import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/Identity%20confirmation%20Screen/views/identity_confirmation_screen.dart';
import 'package:saken_mobile/screens/Reset%20pass/cubit/reset_cubit.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});
  static String id = '/resetPass';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetState>(
      listener: (context, state) {
        if (state is ForgetSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushNamed(context, IdentityConfirmationScreen.id);
        } else if (state is ForgetFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is ResetEmailError) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid Email Form")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      'نسيت كلمة المرور',
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
                    'لا تقلق! هذا يحدث. يُرجى إدخال عنوان البريد الإلكتروني المرتبط بحسابك.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    controller: context.read<ResetCubit>().email,
                    decoration: InputDecoration(
                      hintText: 'البريد الالكتروني او رقم الهاتف',
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
                  state is ForgetLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: GestureDetector(
                            onTap: () {
                              context.read<ResetCubit>().forgetPassword();
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
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
