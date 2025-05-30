import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class CustomBtn extends StatelessWidget{
  final String text ;
  final bool iscontact;
  final bool issetting;
  final bool isadmin;
  final bool isinout;
    final void Function() function;

  CustomBtn(this.text,{this.issetting=false,this.iscontact=false,this.isadmin=false,this.isinout=false, required this.function()});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints:BoxConstraints(maxWidth:double.infinity) ,
      child: ElevatedButton(onPressed: (){function();}, child:Row(
        children: [
          Icon( iscontact?Icons.edit:isadmin?Icons.admin_panel_settings:issetting?Icons.settings:isinout?Icons.insights:
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