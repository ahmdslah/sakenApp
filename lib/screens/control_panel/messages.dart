import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:saken_mobile/const/const%20widgets/messages_tile.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
              child: Text(
            "الرسائل",
            style: TextStyle(
              fontFamily: "cairo",
              color: Color(0xff3C873C),
              fontWeight: FontWeight.w900,
            ),
          )),
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            MessagesTile(
              ontap: () {},
              image: "assets/images/profile1.jpg",
              name: "محمد محسن",
            ),
            MessagesTile(
              ontap: () {},
              image: "assets/images/profile2.jpg",
              name: "حسن علي (مستاجر)",
            ),
            MessagesTile(
              ontap: () {},
              image: "assets/images/profile3.jpg",
              name: "عبدالله (مستاجر)",
            ),
          ],
        ));
  }
}
