// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

TextField editableTextField(StateSetter setState,TextEditingController controller){
  return TextField(
    textAlign: TextAlign.center,
    controller: controller,
    style: tableSubTitleLabelStyle,
    cursorColor: blackColor,
    decoration: InputDecoration(
      isDense: true,
      hintStyle: placeholderTextStyle,
      fillColor: blackColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
    ),
  );
}