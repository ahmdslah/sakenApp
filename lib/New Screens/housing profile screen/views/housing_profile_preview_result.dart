import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/order_details.dart';

class HousingProfilePreviewResult extends StatelessWidget {
  const HousingProfilePreviewResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
      child: Column(
        children: [
          const Text(
            'تم إرسال طلبك',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff378B48),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('تم إرسال طلبك للمأجر وفي انتظار قبوله له'),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color:const Color(0xffFFA500),
                )),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 8, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const  Center(
                    child: Text(
                      'بيانات الطلب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff378B48),
                      ),
                    ),
                  ),
                const  SizedBox(
                    height: 15,
                  ),
                const  OrderDetails(
                    text: 'رقم الطلب : ',
                    result: '  #ABC123',
                  ),
                 const SizedBox(
                    height: 15,
                  ),
                 const OrderDetails(
                    text: 'موعد المعاينة :',
                    result: '  14/1 - 6:00 pm',
                  ),
                 const SizedBox(
                    height: 15,
                  ),
                 const OrderDetails(
                    text: 'المأجر : ',
                    result: '  محمد أحمد',
                  ),
                 const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration:const BoxDecoration(
                      color: Color(0xffF8F8F8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 178,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image:const DecorationImage(
                                image: AssetImage('assets/images/roomm.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const  SizedBox(
                            height: 7,
                          ),
                         const Row(
                            children: [
                              Text('شقة'),
                              Spacer(),
                              Text(
                                '2500 ج.م/شهر',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff378B48),
                                ),
                              )
                            ],
                          ),
                        const  SizedBox(
                            height: 5,
                          ),
                        const  Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('حي شرق, اسكندرية')
                            ],
                          ),
                        const  SizedBox(
                            height: 7,
                          ),
                         const Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text('2 غرفة'),
                              Spacer(),
                              Icon(
                                Icons.bookmark_outline,
                                color: Color(0xffFFA500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
