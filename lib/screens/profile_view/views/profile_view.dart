import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/cubit/profile_edit_cubit.dart';
import 'package:saken_mobile/screens/profile_view/widgets/custom_image_profile.dart';
import 'package:saken_mobile/screens/profile_view/widgets/custom_logout_button.dart';
import 'package:saken_mobile/screens/profile_view/widgets/custom_save_edit_button.dart';
import 'package:saken_mobile/screens/profile_view/widgets/custom_text_field.dart';
import 'package:saken_mobile/screens/profile_view/widgets/text_box.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollections = FirebaseFirestore.instance.collection('users');

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Edit$field',
                style: const TextStyle(color: Colors.white),
              ),
              content: TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter new $field',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  newValue = value;
                  setState(() {});
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(newValue);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ));

    if (newValue.trim().isNotEmpty) {
      await userCollections.doc(currentUser.uid).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: font1,
        centerTitle: true,
        title: const Text(
          'Profile page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData =
                snapshot.data!.data() as Map<String, dynamic>? ?? {};
            return BlocBuilder<ProfileEditCubit, ProfileEditState>(
              builder: (context, state) {
                final cubit = context.read<ProfileEditCubit>();

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomImageProfile(),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            currentUser.email!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'تغيير اسم المستخدم',
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                        MyTextBox(
                          text: userData['userName'] ?? 'No username',
                          sectionName: 'اسم المستخدم',
                          onPressed: () => editField('userName'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'تغيير كلمة المرور',
                          style: TextStyle(
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'كلمة المرور القديمه',
                          controller: cubit.oldPasswordController,
                          isPassword: true,
                          fieldKey: 'oldPassword',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hintText: 'كلمة المرور الجديده',
                          controller: cubit.newPasswordController,
                          isPassword: true,
                          fieldKey: 'newPassword',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hintText: 'تأكيد كلمة المرور',
                          controller: cubit.confirmPasswordController,
                          isPassword: true,
                          fieldKey: 'confirmPassword',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomSaveEditButton(),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomLogoutButton(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erorr${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
