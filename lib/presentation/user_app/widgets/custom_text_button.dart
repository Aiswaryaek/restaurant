import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onTap;
  final String btnText;
  final TextStyle? btnTextStyle;
  final double height;
  const CustomTextButton({super.key,required this.btnText,this.btnTextStyle,this.onTap,this.height = 47});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: double.infinity,
    height: AppScreenUtil().screenHeight(height),
    child: TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: whiteColor,
      ),
      child: Padding(
        padding:const  EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Text(btnText,style: btnTextStyle),
          ],
        ),
      ),
    ),
  );
  }
}