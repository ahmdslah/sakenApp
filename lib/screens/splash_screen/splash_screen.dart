import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/saken_cubit/splash_cubit/splash_cubit.dart';

import '../../const/const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SplashCubit>();
    return Scaffold(
      backgroundColor: splashColor,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          cubit.startSplashTimer();
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("${path}splash logo.png"),
              Image.asset("${path}building splash.png"),
            ],
          );
        },
      ),
    );
  }
}
