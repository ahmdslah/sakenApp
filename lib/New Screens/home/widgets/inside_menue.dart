import 'package:flutter/material.dart';

class InsideMenue extends StatelessWidget {
  const InsideMenue({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
