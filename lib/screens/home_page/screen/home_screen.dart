import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/core/api/end_points.dart';
import 'package:saken_mobile/core/cache/cache_helper.dart';
import 'package:saken_mobile/core/functions/check.dart';
import 'package:saken_mobile/masken/masaken_details.dart';
import 'package:saken_mobile/screens/home_page/tabs/favscreen.dart';
import 'package:saken_mobile/screens/home_page/tabs/hometab.dart';
import 'package:saken_mobile/screens/home_page/tabs/messagescreen.dart';
import 'package:saken_mobile/screens/home_page/tabs/recomendationscreen.dart';
import 'package:saken_mobile/screens/login_page/cubit/login_cubit.dart';
import 'package:saken_mobile/screens/profile_view/views/not_login_profile_veiw.dart';
import 'package:saken_mobile/screens/profile_view/views/profile_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<Widget> tabs = [
    HomeTab(),
    const RecommendationTab(),
    const FavTab(),
    const MessagesTab(),
    CheckToken().isTokenExpired(ApiKeys.token)
        ? ProfileView()
        : NotLoginProfileVeiw()
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
          selectedItemColor: kPrimaryColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: kPrimaryColor,
                  size: 30,
                ),
                label: "الرئيسيه"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.star,
                  size: 30,
                ),
                activeIcon: Icon(
                  CupertinoIcons.star_fill,
                  color: kPrimaryColor,
                  size: 30,
                ),
                label: "الترشيحات"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: kPrimaryColor,
                  size: 30,
                ),
                label: "التفضيلات"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.message,
                  color: kPrimaryColor,
                  size: 30,
                ),
                label: "الرسائل"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  size: 30,
                ),
                activeIcon: Icon(
                  CupertinoIcons.profile_circled,
                  size: 30,
                  color: kPrimaryColor,
                ),
                label: "الشخصي"),
          ]),
      body: tabs[selectedindex],
    );
  }
}
