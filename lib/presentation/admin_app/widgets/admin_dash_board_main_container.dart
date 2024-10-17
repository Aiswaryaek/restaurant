import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class AdminDashBoardMainContainer extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color containerColor;
  const AdminDashBoardMainContainer({super.key,required this.iconPath,required this.title,required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppScreenUtil().screenHeight(108),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
             iconPath,
              height: 25.12,
              width: 22.64,
              color: adminDashBoardIconWhiteColor,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
            Text(
             title,
              style: adminDashBoardContainerLabelStyle,
            )
          ],
        ),
      ),
    );
  }
}
