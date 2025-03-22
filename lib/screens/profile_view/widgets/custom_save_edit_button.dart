import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/cubit/profile_edit_cubit.dart';

class CustomSaveEditButton extends StatefulWidget {
  const CustomSaveEditButton({super.key});

  @override
  State<CustomSaveEditButton> createState() => _CustomSaveEditButtonState();
}

class _CustomSaveEditButtonState extends State<CustomSaveEditButton> {
  Future<void> changePassword(String oldPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser!;
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: oldPassword,
    );

    try {
      // إعادة تسجيل الدخول للتحقق من كلمة المرور القديمة
      await user.reauthenticateWithCredential(credential);

      // تحديث كلمة المرور في Firebase Authentication
      await user.updatePassword(newPassword);

      // تحديث كلمة المرور في Firestore (اختياري)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'password': newPassword, // ⚠️ يفضل عدم تخزين كلمة المرور هنا
      });

      Get.snackbar('نجاح', 'تم تغيير كلمة المرور بنجاح',
          backgroundColor: Colors.green, colorText: Colors.white);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ أثناء تغيير كلمة المرور';
      if (e.code == 'wrong-password') {
        errorMessage = 'كلمة المرور القديمة غير صحيحة';
      } else if (e.code == 'weak-password') {
        errorMessage = 'كلمة المرور الجديدة ضعيفة جدًا';
      }
      Get.snackbar('خطأ', errorMessage,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditCubit, ProfileEditState>(
      builder: (context, state) {
        final cubit = context.read<ProfileEditCubit>();
        return GestureDetector(
          onTap: () {
            final oldPassword = cubit.oldPasswordController.text;
            final newPassword = cubit.newPasswordController.text;
            final confirmPassword = cubit.confirmPasswordController.text;

            if (newPassword == confirmPassword) {
              changePassword(oldPassword, newPassword);
            } else {
              Get.snackbar('خطأ', 'كلمتا المرور غير متطابقتين',
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
            cubit.clearFields();
          },
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: font1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Save Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
