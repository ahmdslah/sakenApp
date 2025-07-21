import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/basic_information.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/comment_details.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/custom_comment_text_field.dart';

class HousingProfileDetails extends StatefulWidget {
  const HousingProfileDetails({super.key});

  @override
  State<HousingProfileDetails> createState() => _HousingProfileDetailsState();
}

class _HousingProfileDetailsState extends State<HousingProfileDetails> {
  bool isExpanded = false;
  bool isExpanded2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffFFA500)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'المعلومات الأساسية',
                  style: TextStyle(
                    color: Color(0xff378B48),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const BasicInformation(text: 'نوع السكن'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'السعر / المدة'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'العنوان'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'مفروشة / فارغة'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'ايجار قديم / جديد - المقدم'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'مدة الإيجار'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'التقييم'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'المساحة'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'الدور'),
                const SizedBox(height: 10),
                const BasicInformation(text: 'شكل السكن'),
                const SizedBox(height: 10),

                // Show more content conditionally
                if (isExpanded) ...[
                  _buildShape(),
                  const BasicInformation(text: 'الأثاث'),
                  const SizedBox(height: 10),
                  _buildFurnishedSection(),
                  const SizedBox(height: 10),
                  const BasicInformation(text: 'الأجهزة'),
                  const SizedBox(height: 10),
                  _buildAppliancesSection(),
                  const SizedBox(height: 10),
                  const BasicInformation(text: 'المرافق'),
                  const SizedBox(height: 10),
                  _buildFacilitiesSection(),
                  const SizedBox(height: 10),
                  const BasicInformation(text: 'وصف السكن'),
                  const SizedBox(height: 10),
                  _buildDescriptionSection(),
                  const SizedBox(height: 10),
                  const BasicInformation(text: 'الموقع'),
                  const SizedBox(height: 10),
                  _buildMapSection(),
                  const SizedBox(height: 10),
                ],

                // زر عرض المزيد / أقل
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'عرض أقل' : 'عرض المزيد',
                    style: const TextStyle(
                      color: Color(0xffFFA500),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xffFFA500),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المستأجرين المستهدفين',
                  style: TextStyle(
                    color: Color(0xff378B48),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BasicInformation(text: 'أفراد / أسر - نوعهم'),
                SizedBox(
                  height: 10,
                ),
                BasicInformation(text: 'التقييم'),
                SizedBox(
                  height: 10,
                ),
                if (isExpanded2) ...[
                  BasicInformation(text: 'وصف العميل'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Wrap(
                        children: [
                          Text('مواصفات المستأجرين التي يفضلها المؤجر')
                        ],
                      ),
                    ),
                  )
                ],
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded2 = !isExpanded2;
                    });
                  },
                  child: Text(
                    isExpanded2 ? 'عرض أقل' : 'عرض المزيد',
                    style: const TextStyle(
                      color: Color(0xffFFA500),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Row(
          children: [
            Icon(
              CupertinoIcons.star,
              color: Colors.grey,
            ),
            Icon(
              CupertinoIcons.star,
              color: Colors.grey,
            ),
            Icon(
              CupertinoIcons.star,
              color: Colors.grey,
            ),
            Icon(
              CupertinoIcons.star,
              color: Colors.grey,
            ),
            Icon(
              CupertinoIcons.star,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: CustomCommentTextField(),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CommentDetails(
          text: 'مستأجر - باحث',
          detail: 'شقة جيدة ولكن غالية',
          rate: '4.5',
        ),
        SizedBox(
          height: 15,
        ),
        CommentDetails(
          text: 'مؤجر - سمسار يؤجر السكن فقط',
          detail: 'شقة جيدة ومريحة',
          rate: '5',
        ),
        SizedBox(
          height: 15,
        ),
        CommentDetails(
          text: 'مستأجر - ساكن',
          detail: 'شقة كويسة بس في الدور السادس ومفيش أسانسير',
          rate: '4',
        ),
      ],
    );
  }

  Widget _buildShape() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(7),
        child: Wrap(
          spacing: 10, // المسافة بين العناصر أفقياً
          runSpacing: 5, // المسافة بين الصفوف رأسياً
          children: [
            Icon(
              Icons.bed_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text('2 غرفة'),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.bathroom_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text('1 حمام'),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.kitchen_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text('مطبخ'),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.living_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text('صالة'),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.balcony_outlined,
              color: Colors.green,
              size: 20,
            ),
            Text('بلكونة'),
          ],
        ),
      ),
    );
  }

  Widget _buildFurnishedSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(7),
        child: Wrap(
          spacing: 10,
          runSpacing: 5,
          children: [
            Icon(Icons.bed_outlined, color: Colors.green, size: 20),
            Text('4 سرير'),
            Icon(Icons.bed_outlined, color: Colors.green, size: 20),
            Text('2 دولاب'),
            Icon(Icons.chair_outlined, color: Colors.green, size: 20),
            Text('5 كرسي'),
            Icon(Icons.table_bar_outlined, color: Colors.green, size: 20),
            Text('1 طربيزة'),
          ],
        ),
      ),
    );
  }

  Widget _buildAppliancesSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(7),
        child: Wrap(
          spacing: 10,
          runSpacing: 5,
          children: [
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('تلاجة'),
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('بوتجاز'),
            Icon(Icons.wifi, color: Colors.green, size: 20),
            Text('غسالة'),
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('3 مراوح'),
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('سخان'),
            Icon(Icons.wifi, color: Colors.green, size: 20),
            Text('انترنت'),
            Icon(Icons.tv, color: Colors.green, size: 20),
            Text('تليفزيون'),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilitiesSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(7),
        child: Wrap(
          spacing: 10,
          runSpacing: 5,
          children: [
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('غاز طبيعي'),
            Icon(Icons.kitchen_outlined, color: Colors.green, size: 20),
            Text('عداد كهرباء بكرت'),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(7),
        child: Text(
          'مواصفات السكن بالطريقة التي يفضل المؤجر وصفه بها أو أي مواصفات للسكن ليس لها قالب جاهز.',
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 221,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/map.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
