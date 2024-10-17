import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class EmployeeDashBoardItems extends StatelessWidget {
  final String iconPath;
  final double iconHeight;
  final double iconWidth;
  final String label;
  final TextStyle? textStyle;
  final Color containerColor;
  final Color? color;
  const EmployeeDashBoardItems({super.key,required this.iconHeight,required this.containerColor,required this.iconPath,required this.iconWidth,this.textStyle,required this.label,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppScreenUtil().screenHeight(49),
                        width: AppScreenUtil().screenWidth(56),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: containerColor),

      child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(iconPath,height: iconHeight,width:iconWidth ,color: color,),
                                  SizedBox(height: AppScreenUtil().screenHeight(5.55),),
                                  Text(label,style:textStyle,textAlign: TextAlign.center,)
                                ],
                              ),
    );
  }
}