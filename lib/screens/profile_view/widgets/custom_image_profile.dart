import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Positioned(
            bottom: 6,
            child: CircleAvatar(
              backgroundColor: font1,
              radius: 12,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
