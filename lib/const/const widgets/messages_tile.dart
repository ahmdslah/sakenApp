import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MessagesTile extends StatelessWidget {
  MessagesTile({
    super.key,
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
      color: const Color(0xffF8F8F8),
      elevation: 5,
      child: ListTile(
        onTap: ontap,
        title: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontFamily: "cairo", fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Icon(
              MaterialCommunityIcons.check_all,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(message),
            const Spacer(),
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
