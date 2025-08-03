import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/profile_view/widgets/offerd_accomodation_details.dart';

class OfferdAccomodationListView extends StatelessWidget {
  const OfferdAccomodationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (c, i) => OfferdAccomodationDetails(),
        separatorBuilder: (c, i) => SizedBox(
          height: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
