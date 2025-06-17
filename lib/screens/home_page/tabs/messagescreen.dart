import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const%20widgets/custom_form_field.dart';
import 'package:saken_mobile/const/const%20widgets/messagecard.dart';
import 'package:saken_mobile/const/const%20widgets/messagerow.dart';

class MessagesTab extends StatelessWidget {
  @override
  TextEditingController searchcontroller = TextEditingController();

  MessagesTab({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: CustomFormField(
                    height: height * 0.5,
                    width: width * 0.7,
                    hintText: "بحث",
                    controller: searchcontroller,
                    validator: (val) {
                      return null;
                    },
                    search: true,
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                    messagecard(),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
            const SizedBox(
              height: 30,
            ),
            MessageRow(),
          ],
        ),
      ),
    );
  }
}
