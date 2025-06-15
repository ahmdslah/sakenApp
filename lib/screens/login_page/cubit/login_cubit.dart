import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saken_mobile/screens/home_view/views/home_view.dart';
import 'package:saken_mobile/screens/login_page/login.dart';

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
      emit(LoginLoading());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
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
}
