import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class EmployeeDashBoardDateAndTimeLayout extends StatelessWidget {
  final Color containerColor;
  final String iconPath;
  final String data;
  const EmployeeDashBoardDateAndTimeLayout({super.key,required this.containerColor,required this.data,required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: AppScreenUtil().screenHeight(24),
      width: AppScreenUtil().screenWidth(90),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: containerColor),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        SvgPicture.asset(iconPath,height: 14,width: 14,color: whiteColor,),
        Text(data,style:employeeDashBoardDateAndTimeLabelStyle ,)
        ],),
      ),
    );
  }
}