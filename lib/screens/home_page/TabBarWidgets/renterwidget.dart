import 'package:flutter/material.dart';
import 'package:saken_mobile/const/Models/usermodel.dart';
import 'package:saken_mobile/const/const%20widgets/User_Card.dart';

class RenterWidget extends StatelessWidget{
  bool fav;
  RenterWidget({this.fav=true});
  @override
  Widget build(BuildContext context) {
   return GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
       childAspectRatio: 1/1.8,
       mainAxisSpacing: 2,
       crossAxisSpacing: 2), itemBuilder:(context,index)=>fav?UserCard():UserCard(isfav: false,),itemCount:usermodel.renters.length);
  }
//usermodel.renters.length
}