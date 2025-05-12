import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saken_mobile/const/Models/apartmentmodel.dart';

class ApartmentCard extends StatefulWidget{
   bool isfavorite;
  ApartmentCard({this.isfavorite=true});

  @override
  State<ApartmentCard> createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> {
  @override
  int index=0;

  void initstate(){
    index++;
  }

  Widget build(BuildContext context) {
    return ClipRRect(clipBehavior: Clip.antiAlias,
        child: Container(
        width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey),color: Color(0xffF5F5F5)
        ),
      child: Stack(
        children: [
      Image.asset(apartmentmodel.apartments[index].photo,fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(alignment: Alignment.topLeft,
            child:widget.isfavorite? SvgPicture.asset("assets/images/Vector.svg"):SvgPicture.asset("assets/images/fav.svg")
        )
        ,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(alignment: Alignment.bottomRight,
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.grey),color: Colors.black.withOpacity(0.3)),
                    child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${apartmentmodel.apartments[index].type}-${apartmentmodel.apartments[index].fees}-${apartmentmodel.apartments[index].rate}",style: TextStyle(fontSize:10,fontWeight: FontWeight.w500,color: Colors.white,overflow: TextOverflow.ellipsis,),),
                              Icon(Icons.star_border,color: Colors.white,),]))),
              ),


                SizedBox(height:5,),
              Align(alignment: Alignment.bottomRight,
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.grey),color: Colors.black.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                      Text(apartmentmodel.apartments[index].address,style: TextStyle(fontSize:10,fontWeight: FontWeight.w500,color: Colors.white,overflow: TextOverflow.ellipsis,),)


                    ],),
                  ),
                ),
              ),
            ],
          ),
        ),
      )



                    ],),
                ),
    );
  }
}