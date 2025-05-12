
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';


class DialogUtils{
  static showLoadingDialog(BuildContext context){
    showDialog(context:context, builder:(context)=>AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading...",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: font1),),
          SizedBox(width: 10,),
          CircularProgressIndicator()
        ],
      ),
    ));

  }
  static showmessagedialog({required BuildContext context,required String text,
    required String posbtntxt,required void Function() posbtnclk}){
    showDialog(context: context, builder:(context)=>AlertDialog(
      content: Text(text,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: font1),),
      actions: [
        TextButton(onPressed:posbtnclk , child:Text(posbtntxt))
      ],
    )
    );
  }

  }


