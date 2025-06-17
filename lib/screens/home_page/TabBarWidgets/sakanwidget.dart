import 'package:flutter/material.dart';
import 'package:saken_mobile/const/Models/apartmentmodel.dart';
import 'package:saken_mobile/const/const%20widgets/apartmint_card.dart';

class sakanwidget extends StatelessWidget {
  bool fav;
  sakanwidget({super.key, this.fav = true});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2),
      itemBuilder: (context, index) => fav
          ? ApartmentCard()
          : ApartmentCard(
              isfavorite: false,
            ),
      itemCount: apartmentmodel.apartments.length,
    );
  }
}
