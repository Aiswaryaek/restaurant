// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class CustomTextFieldWithDate extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final dynamic onTap;
  const CustomTextFieldWithDate({super.key,required this.controller,required this.title,this.onTap});

  @override
  State<CustomTextFieldWithDate> createState() =>
      _CustomTextFieldWithDateState();
}

class _CustomTextFieldWithDateState extends State<CustomTextFieldWithDate> {
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
              color: whiteColor,
              boxShadow:  [
                BoxShadow(
                  color: searchTextColor,
                  offset: Offset(0, 0),
                  blurRadius: 1.5,
                ),
              ]),
          child: SizedBox(
            height: 39,
            child: TextField(
              style: searchInputTextStyle,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 11, bottom: 11),
                    child: SvgPicture.asset(ImageCons.calender,),
                  ),
                  enabledBorder:  OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedBorder:  OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  errorBorder:  OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: whiteColor),
                  ),
                  focusedErrorBorder:  OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: whiteColor),
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
