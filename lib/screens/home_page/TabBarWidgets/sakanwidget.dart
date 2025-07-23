import 'package:flutter/material.dart';
import 'package:saken_mobile/const/Models/apartmentmodel.dart';
import 'package:saken_mobile/const/const%20widgets/apartmint_card.dart';
import 'package:saken_mobile/const/routes.dart';

class sakanwidget extends StatelessWidget {
  bool fav;
  sakanwidget({super.key, this.fav = true});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.sakanDetails);
        },
        child: ApartmentCard(),
      ),
      itemCount: 8,
    );
  }
}
