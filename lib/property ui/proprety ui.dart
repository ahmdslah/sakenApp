import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyScreen extends StatefulWidget {
  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? propertyType;
  String? finishingType;
  String paymentType = 'Installments';
  File? imageFile;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Property')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Property Type'),
              DropdownButtonFormField<String>(
                value: propertyType,
                items: ['Studio', 'Apartment', 'Villa']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => propertyType = value),
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value == null ? 'Please select a type' : null,
              ),
              SizedBox(height: 16),

              Text('Finishing Type'),
              DropdownButtonFormField<String>(
                value: finishingType,
                items: ['Finished', 'Unfinished']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => finishingType = value),
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value == null ? 'Please select finishing' : null,
              ),
              SizedBox(height: 16),

              Text('Property Area (m²)'),
              TextFormField(
                controller: areaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter area' : null,
              ),
              SizedBox(height: 16),

              Text('Contract Date'),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 28 Mar 2025',
                ),
                validator: (value) => value!.isEmpty ? 'Enter date' : null,
              ),
              SizedBox(height: 16),

              Text('Payment Type'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Installments',
                      groupValue: paymentType,
                      onChanged: (value) => setState(() => paymentType = value!),
                      title: Text('Installments'),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Cash',
                      groupValue: paymentType,
                      onChanged: (value) => setState(() => paymentType = value!),
                      title: Text('Cash'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Text('Expected Price'),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter price' : null,
              ),
              SizedBox(height: 16),

              Text('Property Image'),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey[200],
                  ),
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.cover)
                      : Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submission logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Property submitted successfully!')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
