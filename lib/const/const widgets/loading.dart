import 'dart:ui';
import 'package:flutter/material.dart';

void showBlurLoading(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "Loading",
    barrierColor: Colors.transparent, // لون خفيف للشفافية
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // هنا الضباب
        child: Center(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: const CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ),
        ),
      );
    },
  );
}
