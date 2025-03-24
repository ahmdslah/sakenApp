import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';
import 'package:saken_mobile/screens/profile_view/cubit/image_picker_cubit.dart';
import 'package:saken_mobile/screens/profile_view/cubit/profile_edit_cubit.dart';
import 'package:saken_mobile/screens/signup_page/cubit/sign_up_cubit.dart';
import 'package:saken_mobile/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          create: (context) => CustomFormCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
         BlocProvider(
          create: (context) => ProfileEditCubit(),
        ),
         BlocProvider(
          create: (context) => ImagePickerCubit(),
        ),
      ],
      child: GetMaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
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
