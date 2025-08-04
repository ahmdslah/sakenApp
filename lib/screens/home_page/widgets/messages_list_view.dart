import 'package:flutter/cupertino.dart';
import 'package:saken_mobile/screens/home_page/widgets/custom_message.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (c, i) => CustomMessage(),
        separatorBuilder: (c, i) => SizedBox(
          height: 15,
        ),
        itemCount: 20,
      ),
    );
  }
}
