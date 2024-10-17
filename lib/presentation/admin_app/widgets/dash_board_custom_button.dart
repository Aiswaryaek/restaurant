import 'package:flutter/material.dart';


class DashBoardCustomButton extends StatelessWidget {
  final dynamic buttonHeight;

  final Color buttonColor;
  final double borderRadius;
  final String buttonText;
  final TextStyle buttonLabelStyle;
  final dynamic boxShadow;
  final dynamic border;
  final dynamic onTap;


  const DashBoardCustomButton({super.key,required this.buttonHeight,this.onTap,required this.buttonColor,required this.borderRadius,required this.buttonText,required this.buttonLabelStyle,this.border,this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return                GestureDetector(
      onTap: onTap,
      child: Container(
                       
                          height:buttonHeight,
                          decoration:BoxDecoration(color: buttonColor,borderRadius: BorderRadius.circular(borderRadius),boxShadow: boxShadow,border: border) ,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(child: Text(buttonText,style: buttonLabelStyle,)),
                          ),
      
                        ),
    );
  }
}