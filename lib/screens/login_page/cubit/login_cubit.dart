import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:meta/meta.dart';
import 'package:saken_mobile/screens/home_view/views/home_view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
      Get.offAll(const HomeView());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'invalid-credential') {
        emit(LoginFaild(errMessage: 'Wrong email or password'));
      }
    } catch (ex) {
      emit(LoginFaild(errMessage: 'Couldnt signin please try again later'));
    }
  }

    void clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
