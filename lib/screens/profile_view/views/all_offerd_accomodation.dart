import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/widgets/offerd_accomodation_details.dart';
import 'package:saken_mobile/screens/profile_view/widgets/offerd_accomodation_list_view.dart';
import 'package:saken_mobile/screens/profile_view/widgets/profile_rate.dart';

class AllOfferdAccomodation extends StatelessWidget {
  const AllOfferdAccomodation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 20,
                  ),
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile profile.jpg'),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('محمد محسن'),
                      const Text(
                        'مستأجر',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          ProfileRate(
                            icon: CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          ProfileRate(
                            icon: CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          ProfileRate(
                            icon: CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          ProfileRate(
                            icon: CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                          ProfileRate(
                            icon: CupertinoIcons.star_fill,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'السكن المعروض للتأجير',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OfferdAccomodationListView(),
            ],
          ),
        ),
      ),
    );
  }
}
