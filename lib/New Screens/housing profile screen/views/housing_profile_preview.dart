import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/New%20Screens/housing%20profile%20screen/widgets/choose_hour.dart';

class HousingProfilePreview extends StatefulWidget {
  final VoidCallback onSubmit;
  const HousingProfilePreview({super.key, required this.onSubmit});

  @override
  State<HousingProfilePreview> createState() => _HousingProfilePreviewState();
}

class _HousingProfilePreviewState extends State<HousingProfilePreview> {
  List<DateTime?> _dates = [];
  int _selectedHour = 1;
  String _selectedAmPm = 'AM';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'تحديد موعد المعاينة',
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
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xff378B48),
              ),
            ),
            child: Center(
              child: Text(
                '${_dates.isNotEmpty && _dates.first != null ? '${_dates.first!.day}/${_dates.first!.month}' : 'لم يتم التحديد'} - $_selectedHour:00 $_selectedAmPm',
                style: const TextStyle(
                  color: Color(0xff378B48),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'معلومات التواصل معك',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff378B48),
            ),
          ),
          const SizedBox(
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
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                  hintText: 'رقم الهاتف',
                  suffixIcon: const Icon(Icons.phone_outlined),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ))),
            ),
          ),
          const SizedBox(
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
                color: const Color(0xff378B48),
              ),
              child: const Center(
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
