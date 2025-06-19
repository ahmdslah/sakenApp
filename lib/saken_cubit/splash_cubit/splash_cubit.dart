import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_state.dart';
import 'package:saken_mobile/screens/AdminScreen/Adminscreen.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/login.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offAll(Login());
        } else if (user.email == "admin@saken.com") {
          print("------------------------------");

          print(user.email);
          print("------------------------------");
          Get.offAll(const AdminScreen());
        } else {
          Get.offAll(const HomeScreen());
        }
      });
    });
  }
}
