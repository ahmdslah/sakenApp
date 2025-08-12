import 'package:flutter/cupertino.dart';

class OfferdAccomodationInProfilee extends StatelessWidget {
  const OfferdAccomodationInProfilee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Room.png',
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}
