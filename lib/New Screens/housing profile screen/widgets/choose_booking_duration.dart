import 'package:flutter/material.dart';

class ChooseBookingDuration extends StatefulWidget {
  const ChooseBookingDuration({super.key});

  @override
  State<ChooseBookingDuration> createState() => _ChooseBookingDurationState();
}

class _ChooseBookingDurationState extends State<ChooseBookingDuration> {
  String _selectedDuration = 'شهر';
  int _selectedHour = 1;

  final List<String> durationOptions = ['شهر', 'أسبوع', 'يوم'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('مدة الحجز'),
        const Spacer(),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _selectedDuration,
            underline: const SizedBox(),
            items: durationOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDuration = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<int>(
            value: _selectedHour,
            underline: const SizedBox(),
            items: List.generate(12, (index) => index + 1).map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedHour = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
