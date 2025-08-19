import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:saken_mobile/core/api/api_consumer.dart';
import 'package:saken_mobile/core/api/end_points.dart';
import 'package:saken_mobile/core/cache/cache_helper.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/models/sign_in_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  SignInModel? model;
  LoginCubit(this.api) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiConsumer api;

  String? token;
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  void login({required String email, required String password}) async {
    emit(LoginLoading());
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
      token = response.data[ApiKeys.token];
      saveToken(token!);
      print("===== Token Is: $token");
      if (response.data is! Map<String, dynamic>) {
        throw Exception('Invalid response format');
      }

      final responseData = response.data as Map<String, dynamic>;

      if (response.statusCode == 200 &&
          responseData["isAuthenticated"] == true) {
        model = SignInModel.fromJson(responseData);
        Get.offAll(() => const HomeScreen());
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

  saveToken(String token) {
    CacheHelper().saveData(key: "token", value: token);
  }
}
