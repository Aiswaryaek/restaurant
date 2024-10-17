import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
                              height: AppScreenUtil().screenHeight(2),
                              width: AppScreenUtil().screenWidth(54.18),
                              decoration: BoxDecoration(color:dividerColor),
                            );
  }
}