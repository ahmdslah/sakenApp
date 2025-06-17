import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saken_mobile/const/const%20widgets/Custom_btn.dart';
import 'package:saken_mobile/const/const%20widgets/custom_form_field.dart';
import 'package:get/get.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/AdminScreen/Adminscreen.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  @override
  File? pickedImage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _name1Controller.dispose();
    _name2Controller.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      controller: _name1Controller,
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
                      controller: _name2Controller,
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
                isphone: true,
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
              CustomBtn(
                "جهات الاتصال",
                iscontact: true,
                function: () {
                  Get.to(AdminScreen());
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomBtn("الموقع", function: () {
                Get.to(AdminScreen());
              }),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: font1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(color: font1)),
                      ),
                      child: Text("حفظ الاعدادات")))
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
