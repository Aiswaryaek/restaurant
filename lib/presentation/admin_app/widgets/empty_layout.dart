import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../utiles/app_screen_util.dart';


class EmptyLayout extends StatelessWidget {
  final String label;
  const EmptyLayout({super.key,this.label = 'Empty!!'});

  @override
  Widget build(BuildContext context) {
    return Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageCons.imgEmpty,
                  height: AppScreenUtil().screenWidth(158),
                  width: AppScreenUtil().screenWidth(158),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Text(
                  label,
                  style:emptyLayoutLabelStyle
                ),
     
              ],
            ),
          );
  }
}