import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/custom_form_field.dart';

class chatscreen extends StatelessWidget {
  TextEditingController chatcontroller = TextEditingController();

  chatscreen({super.key});
  // static const String routename="chatscreen";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/Image AR.png",
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
          title: const Text(
            "اسم المستخدم",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          toolbarHeight: 70),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Divider(height: 1, color: Colors.grey),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomFormField(
                          height: height * 0.5,
                          width: width * 0.7,
                          hintText: "رساله",
                          controller: chatcontroller,
                          validator: (val) {
                            return null;
                          },
                          search: true,
                        ),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
