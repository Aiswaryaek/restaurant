import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import 'custom_button.dart';

void customAlertDialogueWithImage(BuildContext context,
    {required String title,
    required String imagePath,
    required String firstButtonText,
    required String secondButtonText,
    required dynamic firstButtonOnTap,
    required dynamic secondButtonOnTap}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: constantWhite,
        content: Container(
          color: constantWhite,
          child: Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(29),
                right: AppScreenUtil().screenWidth(29),
                top: AppScreenUtil().screenHeight(18),
                bottom: AppScreenUtil().screenHeight(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: holdOrderStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                SvgPicture.asset(imagePath,
                    height: AppScreenUtil().screenHeight(57),
                    width: AppScreenUtil().screenHeight(
                      57,
                    )),
                SizedBox(
                  height: AppScreenUtil().screenHeight(17),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 100,
                      child: GestureDetector(
                        onTap: firstButtonOnTap,
                        child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(34),
                          buttonColor: Colors.white,
                          borderRadius: 4,
                          buttonText: firstButtonText,
                          buttonLabelStyle: holdAndClearButtonLabelStyle,
                          border: Border.all(
                            color: cartScreenButtonRedColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppScreenUtil().screenWidth(8),
                    ),
                    Expanded(
                      flex: 100,
                      child: GestureDetector(
                        onTap: secondButtonOnTap,
                        child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(34),
                          buttonWidth: double.infinity,
                          buttonColor: cartScreenButtonRedColor,
                          borderRadius: 4,
                          buttonText: secondButtonText,
                          buttonLabelStyle:
                          placeOrderingStyle,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
