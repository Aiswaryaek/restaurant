import 'package:flutter/material.dart';

import 'package:restaurant/utiles/app_screen_util.dart';

class EmployeeDashBoardAttendanceAndLeaveLayout extends StatelessWidget {
  final String title;
  final String data;
  final String subData;
  final TextStyle titleLabelStyle;
  final TextStyle dataLabelStyle;
    final TextStyle subDataLabelStyle;
final Color dataContainerColor;


  const EmployeeDashBoardAttendanceAndLeaveLayout({super.key,required this.data,required this.dataContainerColor,required this.subData,required this.title,required this.dataLabelStyle,required this.subDataLabelStyle,required this.titleLabelStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    ///Attendance Layout
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      Text(title,style: titleLabelStyle,),
    SizedBox(height: AppScreenUtil().screenHeight(6.5),),
    Container(
      height:AppScreenUtil().screenHeight(27.72) ,
    
      width: AppScreenUtil().screenWidth(111.76),
      color: dataContainerColor,
      child: Padding(
        padding:  EdgeInsets.only(top: AppScreenUtil().screenHeight(3.78),left: AppScreenUtil().screenWidth(7.06)),

        child: Text(data,style: dataLabelStyle,),
      ),
    ),
       SizedBox(height: AppScreenUtil().screenHeight(2),),
SizedBox(
        width: AppScreenUtil().screenWidth(111.76),

  child: Align(
    alignment: Alignment.topRight,
    child: Text(subData,style: subDataLabelStyle,)))
],),
 
  ],
);
  }
}