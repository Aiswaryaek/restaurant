// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class TimePickerTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final dynamic onTap;
  const TimePickerTextField({super.key,required this.controller,required this.title,this.onTap});

  @override
  State<TimePickerTextField> createState() =>
      _TimePickerTextFieldState();
}

class _TimePickerTextFieldState extends State<TimePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: bookedTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(8),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: textFieldColor,border: Border.all(color: textFieldColor,width: 3)),
          child: SizedBox(
            height: 35.5,
            child: TextField(
                style: searchInputTextStyle,
                controller: widget.controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 9, bottom: 9),
                      child: SvgPicture.asset(ImageCons.imgClock),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textFieldColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textFieldColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textFieldColor),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textFieldColor),
                    ),
                    labelText: ""),
                readOnly: true,
                onTap:widget.onTap
            ),
          ),
        )
      ],
    );
  }
}
