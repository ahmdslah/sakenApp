import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/ToggleBtn.dart';

class Custom_Row extends StatelessWidget {
  String text;
  Custom_Row(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )),
        Expanded(child: ToggleBtn())
      ],
    );
  }
}
