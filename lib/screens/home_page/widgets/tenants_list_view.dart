import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/home_page/widgets/tenants_details_in_home.dart';

class TenantsListView extends StatelessWidget {
  const TenantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => const TenantsDetailsInHome(),
          separatorBuilder: (c, i) => const SizedBox(
                width: 10,
              ),
          itemCount: 8),
    );
  }
}
