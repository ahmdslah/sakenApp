import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saken_mobile/screens/chatscreen/chatscreen.dart';

class MessageRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topRight,
      child: GestureDetector(onTap:(){Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => chatscreen(),
        ),
      );},
        //Get.offAll(chatscreen);},
        child: Row(mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(width: 4),
            Column(children: [
              Text("اسم المستخدم",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
              SizedBox(height: 5),
              Text("نص الرساله",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12),)
            ],)

          ],),
      ),
    );
  }

}