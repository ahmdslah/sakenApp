import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saken_mobile/New%20Screens/home/widgets/menue_drawer.dart';
import 'package:saken_mobile/const/const%20widgets/category.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/home_page/widgets/lowest_price_list_view.dart';
import 'package:saken_mobile/screens/home_page/widgets/rentering_list_view.dart';
import 'package:saken_mobile/screens/home_page/widgets/sakan_list_view.dart';
import 'package:saken_mobile/screens/home_page/widgets/tenants_list_view.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key, this.name});
  String? name;
  TextEditingController search = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    getUsername().then((value) {
      name = value;
    });

    return Scaffold(
      key: scaffoldKey,
      drawer: const MenueDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/images/logoo.png',
                    ),
                    height: 50,
                    width: 50,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: kPrimaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('حي، محافظة '),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: kPrimaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              color: kPrimaryColor,
                            ),
                            hintText: 'ابحث عن سكن, مؤجرين، مستأجرين ......',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color(0xffE5E7EA),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color(0xffE5E7EA),
                                ))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.filter_alt_outlined,
                    color: kPrimaryColor,
                    size: 35,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                    const SizedBox(
                      width: 10,
                    ),
                    Category(
                      icon: FontAwesomeIcons.restroom,
                      catName: "غرفة",
                      ontap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Category(
                      icon: FontAwesomeIcons.bed,
                      catName: "سرير",
                      ontap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Category(
                      icon: Icons.king_bed,
                      catName: "استوديو",
                      ontap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 102,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Frame (2).png'),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text('سكن'),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              const SakanListView(),
              const SizedBox(
                height: 12,
              ),
              const Row(
                children: [
                  Text(
                    'المؤجرين',
                  ),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const RenteringListView(),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text('المستأجرين'),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const TenantsListView(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text('الاقل سعراً'),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const LowestPriceListView(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text('الاعلي تقييماً'),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const SakanListView(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text('عروض مميزة'),
                  Spacer(),
                  Text(
                    'شاهد الكل',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const SakanListView(),
              // ApartmentCard()
            ]),
          ),
        ),
      ),
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
