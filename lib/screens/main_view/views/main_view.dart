import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/home_view/views/home_view.dart';
import 'package:saken_mobile/screens/profile_view/views/profile_view.dart';

class MainViewController extends GetxController {
  var selectedIndex = 0.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}

class MainView extends StatelessWidget {
  MainView({super.key});
  final MainViewController controller = Get.put(MainViewController());

  final List<Widget> screens = [
    const HomeView(),
    const Center(
      child: Text('filters'),
    ),
    const Center(
      child: Text('Saved'),
    ),
    const Center(
      child: Text('chat'),
    ),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => SizedBox(
            height: 90,
            child: BottomNavigationBar(
              selectedItemColor: font1,
              unselectedItemColor: const Color(0xFF92929D),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
              ),
              selectedLabelStyle: const TextStyle(
                fontSize: 16,
              ),
              currentIndex: controller.selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.updateIndex(index);
              },
              selectedIconTheme: const IconThemeData(size: 30),
              unselectedIconTheme: const IconThemeData(size: 30),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(controller.selectedIndex.value == 0
                      ? Icons.home
                      : Icons.home_outlined),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(controller.selectedIndex.value == 1
                      ? Icons.star
                      : Icons.star_border),
                  label: 'الترشيحات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(controller.selectedIndex.value == 2
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart),
                  label: 'التفضيلات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(controller.selectedIndex.value == 3
                      ? Icons.chat
                      : Icons.chat_outlined),
                  label: 'الرسائل',
                ),
                BottomNavigationBarItem(
                  icon: Icon(controller.selectedIndex.value == 4
                      ? Icons.person
                      : Icons.person_outline),
                  label: 'الشخصي',
                ),
              ],
            ),
          )),
      body: Obx(() => screens[controller.selectedIndex.value]),
    );
  }
}
