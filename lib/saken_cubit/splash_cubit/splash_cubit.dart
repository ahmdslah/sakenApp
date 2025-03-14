import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/screens/home_view/views/home_view.dart';
import 'package:saken_mobile/screens/welcome_screen/welcome.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offAll(const Welcome());
        } else {
          Get.offAll(const HomeView());
        }
      });
    });
  }
}
