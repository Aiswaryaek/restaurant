// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class DashBoardOrderContainer extends StatelessWidget {
  final Color containerColor;
  final String iconPath;
  final Color iconColor;
  final String titleText;
  const DashBoardOrderContainer({super.key,required this.containerColor,required this.iconColor,required this.iconPath,required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: AppScreenUtil().screenHeight(45),
                    width: AppScreenUtil().screenWidth(105),
                    
                    decoration: BoxDecoration(color: containerColor,borderRadius: BorderRadius.circular(8) ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(7 ,)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // ignore: deprecated_member_use
                     
                        Transform.translate(offset: Offset(-3,0),
                child: SvgPicture.asset(iconPath,height: iconPath == ImageCons.adminDashBoardTotalItem?19:21,width: 22,color:iconColor,)),
                        SizedBox(width:AppScreenUtil().screenWidth(7 ,)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                      
                          children: [
                            Text(titleText,style:dashBoardOrderTitleLabelTextStyle ,),
                                                 SizedBox(height:AppScreenUtil().screenWidth(4 ,)),
                                                                           Text('AED 50.00',style:dashBoardOrderSubTitleLabelTextStyle ,),
                      
                      
                      
                      
                        ],)
                      ],),
                    ),
                    
                  );
  }
}