import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saken_mobile/const/Models/usermodel.dart';

class UserCard extends StatelessWidget {
  int index = 0;
  bool isfav;
  UserCard({super.key, this.isfav = true});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            color: const Color(0xffF5F5F5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: isfav
                          ? SvgPicture.asset("assets/images/Vector.svg")
                          : SvgPicture.asset("assets/images/fav.svg")),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/Image AR.png",
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        usermodel.renters[index].username,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${usermodel.renters[index].userrole}-${usermodel.renters[index].rate}",
                        style: TextStyle(
                            fontSize: 8.7,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.star_border,
                        weight: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
