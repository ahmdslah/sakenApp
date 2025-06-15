import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/custom_form_field.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: CustomFormField(
                    height: height * 0.5,
                    width: width * 0.7,
                    hintText: "بحث",
                    controller: searchcontroller,
                    validator: (val) {
                      return null;
                    },
                    search: true,
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
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
                      "مؤجرين ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: selected == 1 ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(46),
                        color: selected == 2
                            ? Colors.blueAccent
                            : const Color(0xffF5F5F5)),
                    child: Text(
                      "مستاجرين ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: selected == 2 ? Colors.white : Colors.black),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
