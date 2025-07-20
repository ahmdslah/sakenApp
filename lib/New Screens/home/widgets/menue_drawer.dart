import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/home/widgets/inside_menue.dart';

class MenueDrawer extends StatelessWidget {
  const MenueDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/new logo.png',
                  scale: 3.7,
                ),
              ),
              const InsideMenue(
                text: 'مواعيد المعاينة الخاصة بي',
              ),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'تتبع عمولتك'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'جهات الاتصال'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'العناصر المحفوظة'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'طباعة العقد للملكية'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'مساعدة'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'الإعدادات'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'السياسات والخصوصية'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'معلومات عنا'),
              const SizedBox(
                height: 25,
              ),
              const InsideMenue(text: 'تسجيل الخروج')
            ],
          ),
        ),
      ),
    );
  }
}
