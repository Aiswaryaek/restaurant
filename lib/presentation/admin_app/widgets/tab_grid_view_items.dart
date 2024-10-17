// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../styles/textstyles.dart';
import '../../../utiles/image_constant.dart';

Widget tabGridViewItems(
    BuildContext context, String categoryImage, String text) {
  return Container(
    height: AppScreenUtil().screenHeight(85),
    width: AppScreenUtil().screenWidth(90),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          categoryImage,
          height: categoryImage==ImageCons.employee?23:categoryImage==ImageCons.imgFoodManagement?24:27,
        ),
        categoryImage==ImageCons.imgFoodManagement?SizedBox(
          height: AppScreenUtil().screenHeight(5),
        ):SizedBox(
          height: AppScreenUtil().screenHeight(11),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            text,
            overflow: TextOverflow.fade,
            maxLines: 3,textAlign: TextAlign.center,
            style: gridTextStyle,
          ),
        )
      ],
    ),
  );
}
