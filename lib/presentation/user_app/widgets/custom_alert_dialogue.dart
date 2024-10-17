import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import 'custom_button.dart';

void customAlertDialogue(BuildContext context,{required String title,required String subTitle,required String firstButtonText,required String secondButtonText,required dynamic firstButtonOnTap,required dynamic secondButtonOnTap}) {
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
            padding:  EdgeInsets.symmetric(vertical:  AppScreenUtil().screenHeight(23),horizontal:AppScreenUtil().screenWidth(29) ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: cartAlertDialogueTitleLabelStyle,
                ),
                SizedBox(height: AppScreenUtil().screenHeight(14),),
                Text(
                  subTitle,
                  style: cartAlertDialogueSubTitleLabelStyle,
                ),
                SizedBox(height: AppScreenUtil().screenHeight(35),),
                Row(
                  children: [
                    Expanded(
                      flex: 100,
                      child: GestureDetector(
                        onTap: firstButtonOnTap,
                        child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(34),
                          buttonColor: Colors.white,
                          borderRadius: 6,
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
                          borderRadius: 6,
                          buttonText: secondButtonText,
                          buttonLabelStyle:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
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
