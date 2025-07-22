import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/basic_information.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/choose_booking_duration.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/choose_hour.dart';

class HousingProfileBooking extends StatefulWidget {
  final VoidCallback onSubmit;
  const HousingProfileBooking({super.key, required this.onSubmit});

  @override
  State<HousingProfileBooking> createState() => _HousingProfileBookingState();
}

class _HousingProfileBookingState extends State<HousingProfileBooking> {
  List<DateTime?> _dates = [];
  int _selectedHour = 1;
  String _selectedAmPm = 'AM';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xffFFA500),
                )),
            child: const Padding(
              padding: EdgeInsets.only(right: 7, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'العربون',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff378B48),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  BasicInformation(text: '100 ج.م - الحجز ليوم'),
                  SizedBox(
                    height: 7,
                  ),
                  BasicInformation(text: '300 ج.م - الحجز لأسبوع'),
                  SizedBox(
                    height: 7,
                  ),
                  BasicInformation(text: '1000 ج.م - الحجز لشهر'),
                  SizedBox(
                    height: 7,
                  ),
                  BasicInformation(text: '3000 ج.م - الحجز لسنة'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'تحديد موعد الحجز',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff378B48),
              ),
            ),
          ),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(),
            value: _dates,
            onValueChanged: (dates) {
              setState(() {
                _dates = dates;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ChooseHour(
            onTimeSelected: (hour, amPm) {
              setState(() {
                _selectedHour = hour;
                _selectedAmPm = amPm;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xff378B48),
              ),
            ),
            child: Center(
              child: Text(
                '${_dates.isNotEmpty && _dates.first != null ? _dates.first!.day.toString() + '/' + _dates.first!.month.toString() : 'لم يتم التحديد'} - $_selectedHour:00 $_selectedAmPm',
                style: const TextStyle(
                  color: Color(0xff378B48),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(),
          const SizedBox(
            height: 20,
          ),
          ChooseBookingDuration(),
          SizedBox(
            height: 20,
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          const Text(
            'معلومات التواصل معك',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff378B48),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  hintText: 'الاسم كامل',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone_outlined),
                  hintText: 'رقم الهاتف',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              widget.onSubmit();
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xff378B48),
              ),
              child: Center(
                child: Text(
                  'إرسال طلب المعاينة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
