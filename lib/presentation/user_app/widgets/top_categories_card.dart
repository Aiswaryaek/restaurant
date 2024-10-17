// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/presentation/admin_app/features/home/home_page.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../styles/textstyles.dart';

Widget topCategoriesCard(
    BuildContext context, String categoryImage, String text,) {
  return AnimatedContainer(
                  duration: Duration(milliseconds: 500),

    height: tabItemContainerHeight,
    width: AppScreenUtil().screenWidth(80),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(2),
    ),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(offset: Offset(0,17),child: SvgPicture.asset(categoryImage,height: 27),),
        Transform.translate(offset: Offset(0,25),child: Text(
          text,overflow: TextOverflow.fade,
          style: mainRedTextStyle,
        ),)
      ],
    ),
  );
}
