import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/views/all_offerd_accomodation.dart';
import 'package:saken_mobile/screens/profile_view/widgets/offerd_accomodation_in_profile.dart';
import 'package:saken_mobile/screens/profile_view/widgets/person_details_in_profile.dart';
import 'package:saken_mobile/screens/profile_view/widgets/profile_button.dart';
import 'package:saken_mobile/screens/profile_view/widgets/profile_rate.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/profile profile.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'مؤجر',
                    style: TextStyle(
                      color: Color(0xff4C4C4C),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileRate(
                      color: Colors.amber,
                      icon: CupertinoIcons.star_fill,
                    ),
                    ProfileRate(
                      color: Colors.amber,
                      icon: CupertinoIcons.star_fill,
                    ),
                    ProfileRate(
                      color: Colors.amber,
                      icon: CupertinoIcons.star_fill,
                    ),
                    ProfileRate(
                      color: Colors.amber,
                      icon: CupertinoIcons.star_fill,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileButton(
                      text: 'اضافة سكن جديد',
                    ),
                    ProfileButton(
                      text: 'تعديل الملف الشخصي',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'نبذة عني',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'السلام عليكم انا اسلام عيسي مدرس مدرسة الثانوية بنات بالاسكندرية متزوج ومعي طفلين ........',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PersonDetailsInProfile(
                      text1: 'الوظيفة',
                      text2: 'مدرس',
                    ),
                    PersonDetailsInProfile(
                      text1: 'السكن المعروض',
                      text2: '5',
                    ),
                    PersonDetailsInProfile(
                      text1: 'مكان السكن',
                      text2: 'الاسكندرية',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('السكن المعروض'),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OfferdAccomodationInProfilee(),
                    OfferdAccomodationInProfilee(),
                    OfferdAccomodationInProfilee(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(const AllOfferdAccomodation());
                      },
                      child: const Text(
                        'مشاهدة الكل',
                        style: TextStyle(
                          color: Color(0xff4C4C4C),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text('الاراء'),
                    const SizedBox(
                      width: 7,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                    ProfileRate(
                      icon: CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 42,
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          decoration: InputDecoration(
                            hintText: 'اضف تعليق',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile1.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kPrimaryColor),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            right: 15,
                            left: 15,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'محمد : مستاجر',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'شخص محترم',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    '12:00 Am',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Color(0xff878787),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
