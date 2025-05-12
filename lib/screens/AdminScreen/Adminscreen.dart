import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class AdminScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
      ),
      body: Center(
        child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [SizedBox(height: 200,),
            ElevatedButton(onPressed:(){}, child:Text("اضافة مستخدم"), style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor:font1,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
            side:BorderSide(color:font1)
                ),)),
            SizedBox(height: 50,),
            ElevatedButton(onPressed:(){}, child:Text("اذالة مستخدم"), style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor:font1,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                side:BorderSide(color:font1)
            ),)),
            SizedBox(height: 50,),
            ElevatedButton(onPressed:(){}, child:Text("تعديل بيانات مستخدم"), style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor:font1,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                side:BorderSide(color:font1)
            ),)),
          ],),
      ),
    );
  }

}