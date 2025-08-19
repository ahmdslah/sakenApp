import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saken_mobile/core/api/api_consumer.dart';
import 'package:saken_mobile/core/api/end_points.dart';
import 'package:saken_mobile/core/errors/exceptions.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(SignUpInitial());
  final ApiConsumer api;
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  XFile? photo;

  uploadimagepacker(XFile image) {
    photo = image;
    emit(uploadimagepackerstate());
  }

  clearAllControllers() {
    fNameController.clear();
    lNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoints.register,
        isFormData: true,
        data: {
          ApiKeys.fullName: "${fNameController.text}${lNameController.text}",
          ApiKeys.email: emailController.text,
          ApiKeys.password: passwordController.text,
          ApiKeys.confirmPassword: confirmPasswordController.text,
          ApiKeys.phoneNumber: " ",
          ApiKeys.photo: " ",
          ApiKeys.role: "Owner",
          ApiKeys.address: "hurgada"
        },
      );
      clearAllControllers();
      removeImage();
      emit(SignUpSuccess(message: response[ApiKeys.message]));
    } on ServerExeption catch (e) {
      emit(SignUpFaild(errorrMessage: e.errorModel.message!));
    } catch (e) {
      emit(SignUpFaild(errorrMessage: e.toString()));
    }
  }

  removeImage() {
    photo = null;
    emit(removeimage());
  }
}
