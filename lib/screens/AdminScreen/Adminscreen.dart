import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/property%20ui/proprety%20ui.dart';
import 'package:saken_mobile/screens/AdminScreen/settingswidget/settingswidget.dart';
import 'package:saken_mobile/screens/home_page/TabBarWidgets/renterwidget.dart';
import 'package:saken_mobile/screens/home_page/TabBarWidgets/sakanwidget.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';

import '../../const/const.dart';

class AdminScreen extends StatefulWidget {
  static const String routename = "AdminScreen";

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

TextEditingController searchcontroller = TextEditingController();
void dispose() {
  searchcontroller.dispose();
}

class _AdminScreenState extends State<AdminScreen> {
  static int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).signOut();
            },
            icon: const Icon(Icons.logout)),
        title: const Center(
            child: Text(
          "لوحة تحكم الادمن",
          style: TextStyle(color: font1, fontFamily: "Cairo"),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const AdminSettings());
              },
              icon: const Icon(
                Icons.settings,
                color: font1,
              ))
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TabBar(
                onTap: (index) {
                  selected = index;
                  setState(() {});
                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(46),
                ),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(46),
                          color: selected == 0
                              ? Colors.blueAccent
                              : const Color(0xffF5F5F5)),
                      child: Text(
                        "سكن ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: selected == 0 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(46),
                          color: selected == 1
                              ? Colors.blueAccent
                              : const Color(0xffF5F5F5)),
                      child: Text(
                        "مستخدمين",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: selected == 1 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          sakanwidget(fav: false),
                          RenterWidget(fav: false)
                        ])),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const AddPropertyScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: font1,
                  foregroundColor: font1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.grey)),
                ),
                child: Text(
                  selected == 0
                      ? "اضافة سكن"
                      : selected == 1
                          ? "اضافة مستخدم"
                          : "اضافة بند ",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
