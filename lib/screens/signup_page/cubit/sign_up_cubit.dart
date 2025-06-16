import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/screens/home_view/views/home_view.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(SignUpLoading());

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = credential.user!.uid;
      await firestore.collection('users').doc(uid).set({
        'uid': uid,
        'userName': userName,
        'email': email,
        'password': password,
        'type': "default account",
        'createdAt': FieldValue.serverTimestamp(),
      });
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFaild(errorrMessage: "The password provided is too weak."));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFaild(
            errorrMessage: "The account already exists for that email."));

        print('The account already exists for that email.');
      }
    }
    //  catch (e) {
    //   print(e);
    // }
/////////////////////////////////////////////////////////////
    // try {
    //   final credential = await FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(email: email, password: password);
    //   String uid = credential.user!.uid;
    //   await firestore.collection('users').doc(uid).set({
    //     'uid': uid,
    //     'userName': userName,
    //     'email': email,
    //     'password': password,
    //     'type': "default account",
    //     'createdAt': FieldValue.serverTimestamp(),
    //   });
    //   emit(SignUpSuccess());
    //   Get.offAll(const HomeView());
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     emit(SignUpFaild(errorrMessage: 'Weak password'));
    //   } else if (e.code == 'email-already-in-use') {
    //     emit(SignUpFaild(errorrMessage: 'This email already exists'));
    //   }
    // }
    catch (e) {
      emit(
        SignUpFaild(errorrMessage: 'Couldnt signup please try again later.'),
      );
    }
  }
}
