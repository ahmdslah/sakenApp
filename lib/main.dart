import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/New%20Screens/New%20Signup/views/new_sign_up.dart';
import 'package:saken_mobile/const/routes.dart';
import 'package:saken_mobile/masken/masaken_details.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saken_mobile/screens/AdminScreen/Adminscreen.dart';
import 'package:saken_mobile/screens/Identity%20confirmation%20Screen/views/identity_confirmation_screen.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/views/new_pass_screen.dart';
import 'package:saken_mobile/screens/Reset%20pass/views/reset_pass.dart';
import 'package:saken_mobile/screens/Success%20Screen/views/success_screen.dart';
import 'package:saken_mobile/screens/home_page/cubit/active_offer_cubit.dart';
import 'package:saken_mobile/screens/home_page/cubit/higest_price_cubit.dart';
import 'package:saken_mobile/screens/home_page/cubit/lowest_price_cubit.dart';
import 'package:saken_mobile/screens/home_page/cubit/sakan_cubit.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';
import 'package:saken_mobile/screens/login_page/login.dart';
import 'package:saken_mobile/screens/profile_screen/edit_info/edit_info.dart';
import 'package:saken_mobile/screens/profile_screen/settings/settings.dart';
import 'package:saken_mobile/screens/signup_page/cubit/sign_up_cubit.dart';
import 'package:saken_mobile/screens/signup_page/sign_up.dart';
import 'package:saken_mobile/screens/welcome_screens/welcome1.dart';
import 'package:saken_mobile/screens/welcome_screens/welcome2.dart';
import 'package:saken_mobile/screens/welcome_screens/welcome3.dart';
import 'firebase_options.dart';
import 'screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
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
        BlocProvider(
          create: (context) => LowestPriceCubit()..getItems(),
        ),
        BlocProvider(
          create: (context) => HigestPriceCubit()..getItems(),
        ),
        BlocProvider(
          create: (context) => SakanCubit()..getItems(),
        ),
          BlocProvider(
          create: (context) => ActiveOfferCubit()..getItems(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: Colors.white)),
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          Routes.splash: (context) => const SplashScreen(),
          Routes.login: (context) => Login(),
          Routes.signup: (context) => SignUp(),
          Routes.homeScreen: (context) => const HomeScreen(),
          Routes.editInfo: (context) => const EditInfo(),
          Routes.settings: (context) => const Settings(),
          Routes.admin: (context) => const AdminScreen(),
          Routes.sakanDetails: (context) => MasakenDetails(),
          Routes.welcome1: (context) => Welcome1(),
          Routes.welcome2: (context) => Welcome2(),
          Routes.welcome3: (context) => Welcome3(),
          IdentityConfirmationScreen.id: (context) =>
              const IdentityConfirmationScreen(),
          NewPassScreen.id: (context) => const NewPassScreen(),
          SuccessScreen.id: (context) => const SuccessScreen(),
          ResetPass.id: (context) => const ResetPass(),
          NewSignUp.id: (context) => const NewSignUp(),
          Login.id: (context) => Login(),
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
