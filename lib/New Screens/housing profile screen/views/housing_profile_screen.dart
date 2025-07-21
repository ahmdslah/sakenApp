import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/views/housing_profile_preview.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/views/housing_profile_preview_result.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/housing_profile_details.dart';

class HousingProfileScreen extends StatefulWidget {
  const HousingProfileScreen({super.key,});

  @override
  State<HousingProfileScreen> createState() => _HousingProfileScreenState();
}

class _HousingProfileScreenState extends State<HousingProfileScreen> {
  String selected = 'تفاصيل';
bool previewSubmitted = false;
  final List<String> tabs = ['تفاصيل', 'معاينة', 'حجز', 'تكاليف', 'مشاركة'];

  Widget getTabContent(String selected) {
    switch (selected) {
      case 'تفاصيل':
        return const HousingProfileDetails();
      case 'معاينة':
        return previewSubmitted
          ? const HousingProfilePreviewResult()
          : HousingProfilePreview(
              onSubmit: () {
                setState(() {
                  previewSubmitted = true;
                });
              },
            );
      case 'حجز':
        return const Text('محتوى الحجز');
      case 'تكاليف':
        return const Text('محتوى التكاليف');
      case 'مشاركة':
        return const Text('محتوى المشاركة');
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 282,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image test.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 148,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xffFF2D55),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'السكن غير متاح الآن',
                            style: TextStyle(
                              color: Color(0xffFF2D55),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'ربما يُتاح في 12/5/2025',
                        style: TextStyle(color: Color(0xff378B48)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 3),
                  const SizedBox(height: 10),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/profile image test.png'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'جمال علي محمد',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'مؤجر - سمسار يأجر ويدير السكن',
                            style: TextStyle(
                              color: Color(0xffF14336),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Text('4,5'),
                              SizedBox(width: 4),
                              Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 15,
                              ),
                              SizedBox(width: 7),
                              Text('(8 أراء)')
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.message, color: Color(0xff378B48)),
                          SizedBox(width: 7),
                          Icon(Icons.call, color: Color(0xff378B48)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(thickness: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: tabs.map((tab) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = tab;
                          });
                        },
                        child: Container(
                          width: 69,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color(0xffF8F8F8),
                          ),
                          child: Center(
                            child: Text(
                              tab,
                              style: TextStyle(
                                color: selected == tab
                                    ? Colors.green
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  getTabContent(selected),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
