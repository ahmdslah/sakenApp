import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/saken_cubit/form_cubit/custom_form_cubit.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';
import 'package:saken_mobile/screens/AdminScreen/Adminscreen.dart';
import 'package:saken_mobile/screens/AdminScreen/settingswidget/settingswidget.dart';
import 'package:saken_mobile/screens/home_page/screen/home_screen.dart';
import 'package:saken_mobile/screens/profile_screen/edit_info/edit_info.dart';
import 'package:saken_mobile/screens/profile_screen/settings/settings.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
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
          create: (context) => CustomFormCubit(),
        ),
      ],
      child: GetMaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
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
