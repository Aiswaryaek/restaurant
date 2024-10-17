
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ColoredPhoneField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final dynamic color;
  final dynamic hint;
  const ColoredPhoneField({super.key,required this.controller,required this.title,this.width,this.color,this.hint});

  @override
  State<ColoredPhoneField> createState() => _ColoredPhoneFieldState();
}

class _ColoredPhoneFieldState extends State<ColoredPhoneField> {
  @override
  Widget build(BuildContext context) {
    return  Column(
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
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.color,border: Border.all(color: widget.color,width: 3)),
          child: SizedBox(
              height: 35.5,
              child: TextField(maxLines: 10,keyboardType: TextInputType.phone,
                controller: widget.controller,
                style: searchInputTextStyle,
                cursorColor: whiteColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true, hintText: widget.hint,
                  hintStyle: loremTextStyle,
                  fillColor: blackColor,focusColor: widget.color,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.color),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.color),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.color),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.color),
                  ),
                ),
              )),
        )
      ],
    );
  }
}