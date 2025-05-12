import 'package:flutter/material.dart';

class messagecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
          children:
          [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],


        );
  }

}
/*Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],
        ),
        SizedBox(width:5),
        Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],
        ),
        SizedBox(width:5),
        Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],
        ),
        SizedBox(width:5),
        Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],
        ),
        SizedBox(width:5),
        Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/Image AR.png", fit: BoxFit.cover, height: 50, width: 50,),
            ),
            SizedBox(height: 2,),
            Text("اسم المستخدم",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),),

          ],
        ),*/