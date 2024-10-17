// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final dynamic buttonHeight;
  final dynamic buttonWidth;
  final Color buttonColor;
  final double borderRadius;
  final String buttonText;
  final TextStyle buttonLabelStyle;
  final dynamic boxShadow;
  final dynamic border;
  final dynamic onTap;

  const CustomButton(
      {super.key,
      required this.buttonHeight,
      this.onTap,
      this.buttonWidth = double.infinity,
      required this.buttonColor,
      required this.borderRadius,
      required this.buttonText,
      required this.buttonLabelStyle,
      this.border,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 2),
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: boxShadow,
            border: border),
        child: Center(
          child: Text(buttonText,
              style: buttonLabelStyle, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
