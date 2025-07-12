import 'package:flutter/material.dart';

class TextFieldResetPass extends StatelessWidget {
  const TextFieldResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        decoration: InputDecoration(
          hintText: 'البريد الالكتروني او رقم الهاتف',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
