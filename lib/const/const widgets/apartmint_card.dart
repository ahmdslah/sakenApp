import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/views/housing_profile_screen.dart';
import 'package:saken_mobile/const/const.dart';

class ApartmentCard extends StatelessWidget {
  final bool fav;
  const ApartmentCard({super.key, this.fav = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(HousingProfileScreen());
      },
      child: Container(
        width: 171,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffF8F8F8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Room.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: fav
                            ? Icon(
                                CupertinoIcons.heart_fill,
                                size: 18,
                                color: Colors.red,
                              )
                            : Icon(
                                CupertinoIcons.heart,
                                size: 18,
                                color: Colors.grey,
                              )),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text('شقة للايجار'),
                  Spacer(),
                  Icon(Icons.more_horiz_outlined),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 20),
                  SizedBox(width: 5),
                  Text(
                    'حي شرق, اسكندرية',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.bed_outlined),
                  SizedBox(width: 5),
                  Text('2 غرفة'),
                  Spacer(),
                  Icon(Icons.bathroom_outlined, size: 20),
                  SizedBox(width: 5),
                  Text('1 حمام'),
                ],
              ),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Text(
                    '4000\$',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text('4.5'),
                  SizedBox(width: 3),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.amber,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
