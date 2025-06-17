import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class ToggleBtn extends StatefulWidget {
  const ToggleBtn({super.key});

  @override
  State<ToggleBtn> createState() => _ToggleBtnState();
}

class _ToggleBtnState extends State<ToggleBtn> {
  int currentval = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: currentval,
      values: const [0, 1],
      onChanged: (newvalue) {
        setState(() {
          currentval = newvalue;
        });
      },
      iconOpacity: 1,
      style: const ToggleStyle(borderColor: font1, indicatorColor: font1),
      iconList: const [
        Icon(
          Icons.notifications_on,
          color: Colors.black,
        ),
        Icon(
          Icons.notifications_off,
          color: Colors.black,
        )
      ],
    );
  }
}
