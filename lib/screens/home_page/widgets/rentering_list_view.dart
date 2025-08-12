import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/home_page/widgets/rentering_details_in_home.dart';

class RenteringListView extends StatelessWidget {
  const RenteringListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => const RenteringDetailsInHome(),
          separatorBuilder: (c, i) => const SizedBox(
                width: 10,
              ),
          itemCount: 8),
    );
  }
}
