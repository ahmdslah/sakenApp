import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/home_page/TabBarWidgets/renterwidget.dart';
import 'package:saken_mobile/screens/home_page/TabBarWidgets/sakanwidget.dart';
import 'package:saken_mobile/screens/home_page/TabBarWidgets/tenentwidget.dart';

class RecommendationTab extends StatefulWidget {
  const RecommendationTab({super.key});

  @override
  State<RecommendationTab> createState() => _FavTabState();
}

TextEditingController searchcontroller = TextEditingController();
void dispose() {
  searchcontroller.dispose();
}

class _FavTabState extends State<RecommendationTab> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'الترشيحات',
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10, bottom: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
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
                      height: 28,
                      width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: selected == 0
                            ? kPrimaryColor
                            : const Color(0xffF5F5F5),
                        border: Border.all(
                          color: kPrimaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "سكن ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:
                                  selected == 0 ? Colors.white : kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 28,
                      width: 104,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selected == 1
                              ? kPrimaryColor
                              : const Color(0xffF5F5F5),
                          border: Border.all(
                            color: kPrimaryColor,
                          )),
                      child: Center(
                        child: Text(
                          "مؤجرين ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:
                                  selected == 1 ? Colors.white : kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 28,
                      width: 104,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selected == 2
                              ? kPrimaryColor
                              : const Color(0xffF5F5F5),
                          border: Border.all(
                            color: kPrimaryColor,
                          )),
                      child: Center(
                        child: Text(
                          "مستاجرين ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:
                                  selected == 2 ? Colors.white : kPrimaryColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          sakanwidget(fav: false),
                          RenterWidget(fav: false),
                          tenantwidget(fav: false)
                        ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
