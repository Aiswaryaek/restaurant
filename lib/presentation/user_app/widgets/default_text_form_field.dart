import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';

class DefaultTextFormField extends StatelessWidget {
 final StateSetter setState;
 final dynamic sufix;
final TextEditingController controller;
  const DefaultTextFormField({super.key,required this.setState,required this.controller,this.sufix});

  @override
  Widget build(BuildContext context) {
    return TextField(
    controller: controller,maxLines: 10,
    style: searchInputTextStyle,textAlign: TextAlign.center,
    cursorColor: whiteColor,
    decoration: InputDecoration(
      suffixIcon: sufix,
      contentPadding: EdgeInsets.all(10),
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
}