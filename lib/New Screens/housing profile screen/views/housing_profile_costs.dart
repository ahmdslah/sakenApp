import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/basic_information.dart';
import 'package:saken_mobile/const/const.dart';

class HousingProfileCosts extends StatelessWidget {
  const HousingProfileCosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15, bottom: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:const Color(0xffFFA500),
                )),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تكاليف الإيجار ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff378B48),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BasicInformation(text: 'إيجار أول شهر: 5000 ج.م'),
                  SizedBox(
                    height: 15,
                  ),
                  BasicInformation(text: 'التأمين: 5000 ج.م'),
                  SizedBox(
                    height: 15,
                  ),
                  BasicInformation(text: 'العمولة: 5000 ج.م'),
                ],
              ),
            ),
          ),
         const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:const Color(0xffFFA500),
                )),
            child:const Center(
              child: Text(
                'المجموع : 15000 ج.م',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
