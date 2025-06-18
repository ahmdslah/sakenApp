import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saken_mobile/const/const%20widgets/apartmint_card.dart';
import 'package:saken_mobile/const/const%20widgets/category.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key, this.name});
  String? name;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getUsername().then((value) {
      name = value;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تطبيق ساكن يرحب بك, ${name}",
          style: TextStyle(color: Color(0xff378B48), fontFamily: "Cairo"),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        ListTile(
          title: Text("الموقع"),
          subtitle: Text("محافظة، حي او اسم الشارع"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt)),
              Expanded(
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    // هنا تعمل الفلترة حسب القيمة
                  },
                  decoration: InputDecoration(
                    hintText: 'ابحث عن سكن ، شقة مناسبة...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Category(
                icon: Icons.house,
                catName: "منزل",
                ontap: () {},
              ),
              Category(
                icon: FontAwesomeIcons.restroom,
                catName: "غرفة",
                ontap: () {},
              ),
              Category(
                icon: FontAwesomeIcons.bed,
                catName: "سرير",
                ontap: () {},
              ),
              Category(
                icon: FontAwesomeIcons.stubber,
                catName: "استوديو",
                ontap: () {},
              ),
            ],
          ),
        ),
        // ApartmentCard()
      ]),
    );
  }
}

Future<String> getUsername() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

  String? name = userDoc.data()?['userName'];
  return name!;
}
