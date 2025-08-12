import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saken_mobile/core/api/api_keys.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  XFile? photo;
  signUp() {
    try {
      final response = Dio().post(
        "http://saken.intern24.org/api/Auth/register",
        data: {
          ApiKeys.fullName:
              "${fNameController.text.trim()} ${lNameController.text.trim()}",
          ApiKeys.email: emailController.text.trim(),
          ApiKeys.phoneNumber: emailController.text.trim(),
          ApiKeys.password: passwordController.text.trim(),
          ApiKeys.confirmPassword: confirmPasswordController.text.trim(),
          ApiKeys.address: "",
          ApiKeys.photo: photo,
          ApiKeys.role: "Owner",
        },
      );
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
