// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ProfileRate extends StatelessWidget {
  Color? color;
  IconData? icon;
  ProfileRate({
    super.key,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 17,
      color: color,
    );
  }
}
