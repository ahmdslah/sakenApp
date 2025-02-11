import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';
import 'package:saken_mobile/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
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
