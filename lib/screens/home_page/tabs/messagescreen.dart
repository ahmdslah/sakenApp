import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/home_page/widgets/custom_message.dart';
import 'package:saken_mobile/screens/home_page/widgets/messages_list_view.dart';

class MessagesTab extends StatelessWidget {
  @override
  MessagesTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'الرسائل',
          style: TextStyle(
            fontSize: 20,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            MessagesListView(),
          ],
        ),
      ),
    );
  }
}
