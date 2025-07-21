import 'package:flutter/material.dart';

class ChooseHour extends StatefulWidget {
  final Function(int hour, String amPm) onTimeSelected;
  const ChooseHour({super.key, required this.onTimeSelected});

  @override
  State<ChooseHour> createState() => _ChooseHourState();
}

String _selectedAmPm = 'AM';
int _selectedHour = 1;

class _ChooseHourState extends State<ChooseHour> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الساعة'),
        const Spacer(),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: _selectedAmPm,
            underline: const SizedBox(),
            items: ['AM', 'PM'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedAmPm = value!;
              });
              widget.onTimeSelected(_selectedHour, _selectedAmPm);
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
              widget.onTimeSelected(_selectedHour, _selectedAmPm);
            },
          ),
        ),
      ],
    );
  }
}
