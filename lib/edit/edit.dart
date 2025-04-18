
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPropertyScreen extends StatefulWidget {
  final String? initialPropertyType;
  final String? initialFinishingType;
  final String initialPaymentType;
  final String initialArea;
  final String initialDate;
  final File? initialImage;

  EditPropertyScreen({
    this.initialPropertyType,
    this.initialFinishingType,
    this.initialPaymentType = 'Installments',
    this.initialArea = '',
    this.initialDate = '',
    this.initialImage,
  });

  @override
  State<EditPropertyScreen> createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController areaController;
  late TextEditingController dateController;
  String? propertyType;
  String? finishingType;
  String paymentType = 'Installments';
  File? imageFile;

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController(text: widget.initialArea);
    dateController = TextEditingController(text: widget.initialDate);
    propertyType = widget.initialPropertyType;
    finishingType = widget.initialFinishingType;
    paymentType = widget.initialPaymentType;
    imageFile = widget.initialImage;
  }

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
      appBar: AppBar(title: Text('Edit Property')),
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

              Text('Property Image'),
              SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[200],
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.cover)
                      : Icon(Icons.camera_alt, size: 50),
                ),
              ),
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save edited property
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Property updated')),
                    );
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
