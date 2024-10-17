import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class EmployeeDashBoardLeaveDetailsContainerLayout extends StatelessWidget {
  final Color titleColor;
  final Color subTitleColor;
  final Color containerColor;
  final String title;
  final String subTitle;
  final double rightPadding;

  const EmployeeDashBoardLeaveDetailsContainerLayout({super.key,required this.containerColor,this.rightPadding=10,required this.subTitle,required this.subTitleColor,required this.title,required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(rightPadding)),
      child: Container(
        height: AppScreenUtil().screenHeight(45),
        width: AppScreenUtil().screenWidth(55),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: containerColor),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: employeeDashBoardLeaveDetailsLayoutLabelStyle(titleColor),),
        SizedBox(height: AppScreenUtil().screenHeight(2),),
              Text(subTitle,style: employeeDashBoardLeaveDetailsLayoutLabelStyle(subTitleColor),),
      
      ],
        ),
      ),
    );
  }
}