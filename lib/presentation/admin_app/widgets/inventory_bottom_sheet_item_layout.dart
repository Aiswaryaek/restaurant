import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class InventoryBottomSheetItemLayout extends StatelessWidget {
  final String iconPath;
  final double iconWidth;
  final double iconHeight;
  final dynamic iconColor;

  const InventoryBottomSheetItemLayout({super.key,required this.iconHeight,required this.iconPath,required this.iconWidth, this.iconColor });

  @override
  Widget build(BuildContext context) {
    return  Container(
                width: AppScreenUtil().screenWidth(52),
                height: AppScreenUtil().screenHeight(52),
                decoration: const BoxDecoration(shape: BoxShape.circle,color: constantWhite,boxShadow: [BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: inventoryBottomSheetItemBoxshadowColor,
                )]),
                // ignore: deprecated_member_use
                child: Center(child: SvgPicture.asset(iconPath,width: iconWidth,height: iconHeight,color: iconColor,)
                ),
              );
  }
}