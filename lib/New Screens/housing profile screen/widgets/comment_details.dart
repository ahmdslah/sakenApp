import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentDetails extends StatelessWidget {
  const CommentDetails({
    super.key,
    required this.text,
    required this.detail,
    required this.rate,
  });

  final String text;
  final String detail;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // مهم جداً
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile2.jpg'),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text('على السيد'),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: Color(0xffFF2D55)),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                detail,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('12:00 am'),
            Row(
              children: [
                Text(rate),
                SizedBox(width: 3),
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 15,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
