import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  Category({super.key, this.ontap, required this.icon, required this.catName});
  Function()? ontap;
  IconData? icon;
  String? catName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF8F8F8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: const Color(0xffA5A5A5),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              catName!,
              style: const TextStyle(
                color: Color(0xffA5A5A5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
