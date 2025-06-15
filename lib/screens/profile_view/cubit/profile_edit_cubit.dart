import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(ProfileEditInitial());
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollections = FirebaseFirestore.instance.collection('users');
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void clearFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  final Map<String, bool> _obstructMap = {
    'oldPassword': true,
    'newPassword': true,
    'confirmPassword': true,
  };

  void toggleObstruct(String field) {
    _obstructMap[field] = !_obstructMap[field]!;
    emit(ProfileChangeEye());
  }

  bool getObstruct(String field) {
    return _obstructMap[field]!;
  }

  bool isObstruct = true;
  void showOrHidePassword() {
    isObstruct = !isObstruct;
    emit(ProfileChangeEye());
  }
}
