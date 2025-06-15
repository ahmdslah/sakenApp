import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/Routes.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/main_view/views/main_view.dart';
import 'package:saken_mobile/screens/signup_page/cubit/sign_up_cubit.dart';
import 'package:saken_mobile/screens/signup_page/sign_up.dart';
import 'firebase_options.dart';
import 'screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => CustomFormCubit(),
        ),
      ],
      child: GetMaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          Routes.splash: (context) => SplashScreen(),
          Routes.login: (context) => Login(),
          Routes.signup: (context) => SignUp(),
          Routes.mainView: (context) => MainView(),
        },
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // Forces RTL throughout the app
            child: child!,
          );
        },
      ),
    );
  }
}
