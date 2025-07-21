import 'package:flutter/material.dart';

class CustomCommentTextField extends StatelessWidget {
  const CustomCommentTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
          hintText: 'اكتب رأيك بناء على تجربتك مع هذا السكن ..... ',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Color(0xffFFA500),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Color(0xffFFA500),
            ),
          )),
    );
  }
}
