// Flutter code for tenant (المستأجر) screens using Dart, each screen in its own class

import 'package:flutter/material.dart';

// 1. Request Saken Screen
class RequestSakenScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RequestSakenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب سكن')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'عقار 1', child: Text('عقار 1')),
                  DropdownMenuItem(value: 'عقار 2', child: Text('عقار 2')),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(labelText: 'اختر العقار'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'تاريخ البدء'),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'ملاحظات'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('طلب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
