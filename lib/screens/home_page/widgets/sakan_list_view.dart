import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/home_page/widgets/sakan_details_in_home.dart';

class SakanListView extends StatelessWidget {
  const SakanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) => const SakanDetailsInHome(),
        separatorBuilder: (c, i) => const SizedBox(
          width: 10,
        ),
        itemCount: 8,
      ),
    );
  }
}
