import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.text, required this.result});
  final String text;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Text(result),
      ],
    );
  }
}
