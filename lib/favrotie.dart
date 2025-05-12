import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  RangeValues ageRange = RangeValues(25, 40);
  String gender = "أي";
  String job = "";
  bool allowSmoking = false;
  int peopleCount = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("%التفضيلات")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text("العمر المناسب: ${ageRange.start.round()} - ${ageRange.end.round()}"),
              RangeSlider(
                values: ageRange,
                min: 18,
                max: 60,
                divisions: 42,
                labels: RangeLabels("${ageRange.start.round()}", "${ageRange.end.round()}"),
                onChanged: (RangeValues values) {
                  setState(() {
                    ageRange = values;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: gender,
                items: ["أي", "ذكر", "أنثى"].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                decoration: InputDecoration(labelText: "النوع المفضل"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "المهنة المطلوبة"),
                onChanged: (val) => job = val,
              ),
              SwitchListTile(
                title: Text("السماح بالتدخين"),
                value: allowSmoking,
                onChanged: (val) => setState(() => allowSmoking = val),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("عدد الأفراد المسموح: $peopleCount"),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.remove), onPressed: () {
                        if (peopleCount > 1) setState(() => peopleCount--);
                      }),
                      IconButton(icon: Icon(Icons.add), onPressed: () {
                        setState(() => peopleCount++);
                      }),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save preferences logic
                },
                child: Text("حفظ التفضيلات"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
