import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({super.key, this.ontap, required this.icon, required this.catName});
  Function()? ontap;
  IconData? icon;
  String? catName;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: ontap,
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                catName!,
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
