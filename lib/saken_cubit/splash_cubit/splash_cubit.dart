import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/screens/welcome_screen/welcome.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplashTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(const Welcome());
    });
  }
}
