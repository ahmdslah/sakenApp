import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/login_page/models/sign_in_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  SignInModel? model;
  LoginCubit() : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      if (email == 'admin@saken.com' && password == 'admin1234') {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(LoginAdminSuccess());
      } else {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(LoginUserSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFaild(errMessage: 'No user found for that email.'));

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFaild(errMessage: 'Wrong password provided for that user.'));

        print('Wrong password provided for that user.');
      }
    } catch (ex) {
      emit(LoginFaild(errMessage: 'Couldnt signin please try again later'));
    }
  }

  void signOut() async {
    emit(SigningOutLoading());
    GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    emit(SigningOutSuccess());
    Get.offAll(Login());
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  void login({required String email, required String password}) async {
    emit(LoginnLoading());
    try {
      final response = await DioHelper.postUrls(
        Url: 'Auth/Login',
        body: {
          'email': email.trim(),
          'password': password.trim(),
          'role': 'Owner',
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.data is! Map<String, dynamic>) {
        throw Exception('Invalid response format');
      }

      final responseData = response.data as Map<String, dynamic>;

      if (response.statusCode == 200 &&
          responseData["isAuthenticated"] == true) {
        model = SignInModel.fromJson(responseData);
        Get.offAll(HomeScreen());
        emit(LoginnSuccess(model!));
      } else {
        final msg = responseData["message"] ??
            "البريد الإلكتروني أو كلمة المرور غير صحيحة";
        emit(LoginnErorr(msg));
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      print('Dio Error Status: ${e.response?.statusCode}');
      print('Dio Error Response: ${e.response?.data}');

      String errorMessage = 'حدث خطأ غير معروف';
      if (e.response?.data is Map) {
        errorMessage = e.response?.data['message']?.toString() ??
            e.response?.data.toString() ??
            errorMessage;
      }
      emit(LoginnErorr(errorMessage));
    } catch (e) {
      print('Unexpected Error: $e');
      emit(LoginnErorr('البريد الإلكتروني أو كلمة المرور غير صحيحة'));
    }
  }
}
