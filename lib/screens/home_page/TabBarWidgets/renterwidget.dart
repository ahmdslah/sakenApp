import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/User_Card.dart';

class RenterWidget extends StatelessWidget {
  bool fav;
  RenterWidget({super.key, this.fav = true});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) => const UserCard(),
      itemCount: 8,
    );
  }
//usermodel.renters.length
}
