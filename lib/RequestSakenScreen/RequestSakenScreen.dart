// Flutter code for tenant (المستأجر) screens using Dart, each screen in its own class

import 'package:flutter/material.dart';

// 1. Request Saken Screen
class RequestSakenScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلب سكن')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(value: 'عقار 1', child: Text('عقار 1')),
                  DropdownMenuItem(value: 'عقار 2', child: Text('عقار 2')),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(labelText: 'اختر العقار'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'تاريخ البدء'),
                keyboardType: TextInputType.datetime,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ملاحظات'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('طلب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}