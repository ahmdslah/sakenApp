import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:const Color(0xffF8F8F8),
      ),
      child:const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: CircleAvatar(
                radius: 28,
                backgroundImage:
                    AssetImage('assets/images/profile profile.jpg'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'محمد محسن ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.done_all,
                      size: 17,
                      color: Color(0xff7F7F7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'اهلا.....',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff7F7F7F),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Text(
              '9:00 Am',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff7F7F7F),
              ),
            )
          ],
        ),
      ),
    );
  }
}
