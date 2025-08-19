import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/core/api/end_points.dart';
import 'package:saken_mobile/core/cache/cache_helper.dart';
import 'package:saken_mobile/core/functions/check.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_state.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/welcome_screens/policy.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      bool isFirstTime = CacheHelper().getData(data: "isFirstTime") ?? true;
      if (isFirstTime) {
        Get.offAll(() => const Policy());
      } else {
        if (!CheckToken()
            .isTokenExpired(CacheHelper().getData(data: ApiKeys.token))) {
          Get.offAll(() => HomeScreen());
        } else {
          Get.offAll(() => Login());
        }
      }
    });
  }
}
