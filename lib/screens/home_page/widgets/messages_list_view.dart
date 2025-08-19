import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/home_page/widgets/custom_message.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (c, i) => const CustomMessage(),
        separatorBuilder: (c, i) => const SizedBox(
          height: 15,
        ),
        itemCount: 20,
      ),
    );
  }
}
