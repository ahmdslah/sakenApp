// 2. Edit Request Screen
import 'package:flutter/material.dart';

class EditRequestScreen extends StatelessWidget {
  final String selectedProperty;
  final String startDate;
  final String notes;

  EditRequestScreen({
    super.key,
    required this.selectedProperty,
    required this.startDate,
    required this.notes,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final propertyController = TextEditingController(text: selectedProperty);
    final dateController = TextEditingController(text: startDate);
    final notesController = TextEditingController(text: notes);

    return Scaffold(
      appBar: AppBar(title: const Text('تعديل الطلب')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: propertyController,
                decoration: const InputDecoration(labelText: 'العقار'),
                readOnly: true,
              ),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'تاريخ البدء'),
              ),
              TextFormField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'ملاحظات'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('تحديث'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
