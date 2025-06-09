import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class CustomBtn extends StatelessWidget{
  final String text ;
  final bool islocation;
  final bool iscontact;
  CustomBtn(this.text,{this.islocation=false,this.iscontact=false});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints:BoxConstraints(maxWidth:double.infinity) ,
      child: ElevatedButton(onPressed: (){}, child:Row(
        children: [
          Icon( iscontact?Icons.edit:
          Icons.location_on,color: font1,
             ),
          Text(text,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: font1),),
        ],
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: font1,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
          side:BorderSide(color: Colors.grey)
      ),
      ),),
    );
  }

}