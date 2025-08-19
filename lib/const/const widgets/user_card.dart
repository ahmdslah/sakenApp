import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('احمد محمد'),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'صاحب عقار',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('4.5'),
                SizedBox(
                  width: 3,
                ),
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
