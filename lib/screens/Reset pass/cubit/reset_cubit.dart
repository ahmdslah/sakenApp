import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:saken_mobile/core/api/api_consumer.dart';
import 'package:saken_mobile/core/api/end_points.dart';
import 'package:saken_mobile/core/errors/exceptions.dart';
import 'package:saken_mobile/core/functions/check.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit(this.api) : super(ResetInitial());
  final ApiConsumer api;
  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  forgetPassword() async {
    bool isEmail = CheckEmail().isEmail(email.text);
    if (isEmail) {
      try {
        emit(ForgetLoading());
        final response = await api.post(
          "${EndPoints.forgetPassword}${email.text.trim()}",
        );

        emit(ForgetSuccess(message: response.toString()));
      } on ServerExeption catch (e) {
        emit(ForgetFailed(message: e.errorModel.message!));
      }
    } else {
      emit(ResetEmailError());
    }
  }

  resetPassword() async {
    try {
      emit(ResetLoading());
      final response = await api.post(EndPoints.resetPassword, data: {
        ApiKeys.email: email.text,
        ApiKeys.resetCode: code.text,
        ApiKeys.newPassword: password.text
      });
      emit(ResetSuccess(message: response));
      email.clear();
      code.clear();
      password.clear();
      confirmPassword.clear();
    } on ServerExeption catch (e) {
      emit(ResetFailed(message: e.toString()));
    }
  }
}

// {
//   "email": "osrhma@gmail.com",
//   "resetCode": "24247514",
//   "newPassword": "Asyw@22111"
// }
