// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

TextField defaultTextField(StateSetter setState,TextEditingController controller){
  return TextField(
    controller: controller,maxLines: 10,
    style: searchInputTextStyle,
    cursorColor: whiteColor,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      isDense: true,
      hintStyle: placeholderTextStyle,
      fillColor: blackColor,
      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: whiteColor),
      ),
      errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: whiteColor),
      ),
    ),
  );
}