import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saken_mobile/const/const%20widgets/User_Card.dart';
import 'package:saken_mobile/screens/home_page/tabs/favscreen.dart';
import 'package:saken_mobile/screens/home_page/tabs/hometab.dart';
import 'package:saken_mobile/screens/home_page/tabs/messagescreen.dart';
import 'package:saken_mobile/screens/home_page/tabs/profilescreen.dart';
import 'package:saken_mobile/screens/home_page/tabs/recomendationscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<Widget> tabs = [
    HomeTab(),
    RecommendationTab(),
    FavTab(),
    MessagesTab(),
    ProfileTab()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (newindex) {
            selectedindex = newindex;
            setState(() {
              selectedindex = newindex;
              print(selectedindex);
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/home.svg"),
                activeIcon: SvgPicture.asset("assets/images/homes.svg"),
                label: "الرئيسيه"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/rec.svg"),
                activeIcon: SvgPicture.asset("assets/images/recs.svg"),
                label: "الترشيحات"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/fav.svg"),
                activeIcon: SvgPicture.asset("assets/images/favs.svg"),
                label: "التفضيلات"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/message.svg"),
                activeIcon: SvgPicture.asset("assets/images/messages.svg"),
                label: "الرسائل"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/profile.svg"),
                activeIcon: SvgPicture.asset("assets/images/profile.svg"),
                label: "الملف الشخصي"),
          ]),
      body: tabs[selectedindex],
    );
  }
}
