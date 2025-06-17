import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

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
      appBar: AppBar(title: const Text('Add Property')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Property Type'),
              DropdownButtonFormField<String>(
                value: propertyType,
                items: ['Studio', 'Apartment', 'Villa']
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => propertyType = value),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    value == null ? 'Please select a type' : null,
              ),
              const SizedBox(height: 16),
              const Text('Finishing Type'),
              DropdownButtonFormField<String>(
                value: finishingType,
                items: ['Finished', 'Unfinished']
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => finishingType = value),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    value == null ? 'Please select finishing' : null,
              ),
              const SizedBox(height: 16),
              const Text('Property Area (m²)'),
              TextFormField(
                controller: areaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter area' : null,
              ),
              const SizedBox(height: 16),
              const Text('Contract Date'),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 28 Mar 2025',
                ),
                validator: (value) => value!.isEmpty ? 'Enter date' : null,
              ),
              const SizedBox(height: 16),
              const Text('Payment Type'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Installments',
                      groupValue: paymentType,
                      onChanged: (value) =>
                          setState(() => paymentType = value!),
                      title: const Text('Installments'),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Cash',
                      groupValue: paymentType,
                      onChanged: (value) =>
                          setState(() => paymentType = value!),
                      title: const Text('Cash'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Expected Price'),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter price' : null,
              ),
              const SizedBox(height: 16),
              const Text('Property Image'),
              const SizedBox(height: 8),
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
                      : const Icon(Icons.add_a_photo,
                          size: 40, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submission logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Property submitted successfully!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
