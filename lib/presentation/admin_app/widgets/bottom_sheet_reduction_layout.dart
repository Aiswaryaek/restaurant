import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/dash_board_custom_button.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class BottomSheetReductionLayout extends StatelessWidget {
  final String headText;
  final dynamic onTap;
  final dynamic buttonText;
  const BottomSheetReductionLayout({super.key,required this.headText,this.onTap,this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:  AppScreenUtil().screenHeight(12),left:  AppScreenUtil().screenWidth(16),right:  AppScreenUtil().screenWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
        Text(
                headText,
                style: dashBoardLabelTextStyle,
              ),
              DashBoardCustomButton(buttonHeight: AppScreenUtil().screenHeight(20), buttonColor: reductionBottomSheetButtonColor, borderRadius: 4, buttonText: buttonText, buttonLabelStyle: placeOrderingAndConfirmPaymentButtonLabelStyle,onTap: onTap,)
      ],),
    );
  }
}