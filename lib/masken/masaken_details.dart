import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class MasakenDetails extends StatelessWidget {
  MasakenDetails({super.key});
  final List<String> imageUrls = [
    'assets/images/Room.png',
    'assets/images/Room2.png',
    'assets/images/room3.png',
    'assets/images/room4.png',
    'assets/images/room5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: font1),
        title: Text(
          'شقة دور تالت الحي السادس',
          style: TextStyle(
            color: Colors.teal[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
            ),

            const SizedBox(height: 20),

            // العنوان
            Center(
              child: Text(
                'شقة متشطبة سوبر لوكس الحي السادس',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),

            // العنوان الكامل
            Row(
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.grey),
                SizedBox(width: 5),
                Expanded(child: Text('الحي السادس، مدينة نصر، القاهرة'))
              ],
            ),
            const SizedBox(height: 10),

            // المساحة
            Row(
              children: const [
                Icon(Icons.square_foot, color: Colors.grey),
                SizedBox(width: 5),
                Text('المساحة: 160 متر'),
              ],
            ),
            const SizedBox(height: 10),

            // عدد الغرف والحمامات
            Row(
              children: const [
                Icon(Icons.bed, color: Colors.grey),
                SizedBox(width: 5),
                Text('3 غرف نوم'),
                SizedBox(width: 20),
                Icon(Icons.bathtub, color: Colors.grey),
                SizedBox(width: 5),
                Text('2 حمام'),
              ],
            ),
            const SizedBox(height: 10),

            // السعر
            Row(
              children: const [
                Icon(Icons.monetization_on_outlined, color: Colors.grey),
                SizedBox(width: 5),
                Text('الإيجار الشهري: 5000 جنيه'),
              ],
            ),
            const SizedBox(height: 20),

            // وصف تفصيلي
            const Text(
              'تفاصيل إضافية:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              'الشقة في الدور التالت بدون اسانسير، تشطيب سوبر لوكس، قريبة من الخدمات والمواصلات. بها بلكونة ومطبخ مجهز.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // زر التواصل
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // الإجراء عند التواصل
                },
                icon: const Icon(Icons.phone),
                label: const Text(
                  'تواصل الآن',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
