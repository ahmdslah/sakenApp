import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/widgets/custom_image_profile.dart';
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
                'Edit' + field,
                style:const TextStyle(color: Colors.white),
              ),
              content: TextField(
                autofocus: true,
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter new $field',
                  hintStyle:const TextStyle(color: Colors.grey),
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
                  child:const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(newValue);
                  },
                  child:const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ));

    if (newValue.trim().length > 0) {
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
            return ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const CustomImageProfile(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                MyTextBox(
                  text: userData['userName'] ?? 'No username',
                  sectionName: 'اسم المستخدم',
                  onPressed: () => editField('userName'),
                ),
              ],
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
