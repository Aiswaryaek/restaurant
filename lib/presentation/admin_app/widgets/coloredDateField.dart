// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class ColoredDateField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final dynamic onTap;
  final double textFieldHeight;
  const ColoredDateField(
      {super.key, required this.controller, required this.title, this.onTap,this.textFieldHeight = 41});

  @override
  State<ColoredDateField> createState() => _ColoredDateFieldState();
}

class _ColoredDateFieldState extends State<ColoredDateField> {
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
        Container(height: widget.textFieldHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: textFieldColor),
          child: TextField(
              style: searchInputTextStyle,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 2,left: 10),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: SvgPicture.asset(ImageCons.calender,height: 10,width: 10,),
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
              onTap: widget.onTap),
        )
      ],
    );
  }
}
