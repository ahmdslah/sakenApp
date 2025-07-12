import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style:const TextStyle(
          fontSize: 13,
          color: Color(0xff444746),
        ),
      ),
    );
  }
}
