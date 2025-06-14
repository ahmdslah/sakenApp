import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MessagesTile extends StatelessWidget {
  MessagesTile({
    this.message = 'رسالة وهمية...',
    this.name = 'اسم افتراضي',
    this.image = "assets/images/Image AR.png",
    this.time = '10:00 AM',
    this.ontap,
  });

  String name;
  String message;
  String time;
  String image;
  Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF8F8F8),
      elevation: 5,
      child: ListTile(
        onTap: ontap,
        title: Row(
          children: [
            Text(
              name,
              style:
                  TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              MaterialCommunityIcons.check_all,
              size: 18,
            ),
            SizedBox(
              width: 10,
            ),
            Text(message),
            Spacer(),
            Text(time)
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
