// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

Widget defaultButton(BuildContext context, String btnText,Function callbackAction) {
  return SizedBox(
    width: double.infinity,
    height: 47,
    child: TextButton(
      onPressed: () => callbackAction(),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: whiteColor,
      ),
      child: Padding(
        padding:  EdgeInsets.all(2),
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