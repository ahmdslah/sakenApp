import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saken_mobile/const/const%20widgets/custom_form_field.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  @override
  File? pickedImage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _walletController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "الحساب",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "الاعدادات الشخصيه",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              pickedImage == null
                  ? Center(
                      child: GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: Image.asset("assets/images/Image AR.png"),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        pickedImage!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomFormField(
                      height: height * 0.7,
                      width: width * 0.5,
                      hintText: "الاسم الاول ",
                      isName: true,
                      controller: _nameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'من فضلك ادخل اسمك';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomFormField(
                      height: height * 0.7,
                      width: width * 0.5,
                      hintText: "الاسم الثاني",
                      isName: true,
                      controller: _nameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'من فضلك ادخل اسمك';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "البريد الالكتروني",
                iscontact: true,
                controller: _emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل البريد الالكتروني';
                  }
                  // Regex for email validation
                  final regex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!regex.hasMatch(val)) {
                    return 'من فضلك ادخل بريد الكتروني صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "تغير رقم الهاتف",
                isphone: true,
                controller: _phoneController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل رقم الهاتف';
                  }
                  // Regex for email validation

                  if (val.length < 11) {
                    return 'من فضلك ادخل رقم هاتف صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "تغير كلمة السر",
                isPassword: true,
                controller: _passwordController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل كلمة السر';
                  }
                  // Password validation
                  if (val.length < 8) {
                    return 'كلمة السر قصيرة';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "جهات الاتصال ",
                iscontact: true,
                controller: _contactController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل رقم الهاتف';
                  }

                  if (val.length < 11) {
                    return 'من فضلك ادخل رقم هاتف صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "الموقع ",
                islocation: true,
                controller: _locationController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل موقعك';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomFormField(
                height: height * 0.7,
                width: width,
                hintText: "المحفظة ",
                iswallet: true,
                controller: _walletController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'من فضلك ادخل رقم المحفظة';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'اختر صورتك الشخصيه',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            pickedImage = await selectImageFromGallery();

                            if (pickedImage != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("فشل وضع الصوره !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('المعرض'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            pickedImage = await selectImageFromCamera();

                            if (pickedImage != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("فشل وضع الصوره"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('الكاميرا'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  //
  selectImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
