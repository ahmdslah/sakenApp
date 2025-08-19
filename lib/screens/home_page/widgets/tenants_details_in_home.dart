import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class TenantsDetailsInHome extends StatelessWidget {
  const TenantsDetailsInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171,
      width: 109,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffF8F8F8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Color(0xffFFA500),
                  size: 12,
                ),
              ],
            ),
            const CircleAvatar(
              backgroundColor: ksecondaryColor,
              radius: 28,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 27,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'هدى السيد',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: ksecondaryColor,
                ),
              ),
              child: const Center(
                child: Text(
                  'صاحب عقار',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('4.5'),
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
