import 'package:flutter/material.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ChartIndicationContainerLayout extends StatelessWidget {
  final String label;
  final Color containerColor;
  const ChartIndicationContainerLayout({super.key,required this.containerColor,required this.label});

  @override
  Widget build(BuildContext context) {
    return   Row(children: [
                      Container(
                        height: AppScreenUtil().screenHeight(12.67),
                        width: AppScreenUtil().screenWidth(13.82),
                        decoration: BoxDecoration(color: containerColor,borderRadius: BorderRadius.circular(4)),
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(4),),
                      Text(label,style: employeeDashBoardChartSubTitleLabelStyle,)
                    ],);
  }
}