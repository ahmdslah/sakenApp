import 'package:flutter/material.dart';

class BasicInformation extends StatelessWidget {
  const BasicInformation({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 6,
          child: CircleAvatar(
            radius: 3,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
