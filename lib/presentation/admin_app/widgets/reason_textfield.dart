// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ReasonTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final dynamic color;
  const ReasonTextField({super.key,required this.controller,required this.title,this.width,this.color});

  @override
  State<ReasonTextField> createState() => _ReasonTextFieldState();
}

class _ReasonTextFieldState extends State<ReasonTextField> {
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
            height: 80,
            child: Transform.translate(offset: const Offset(0,-3),child: TextField(maxLines: 10,
              controller: widget.controller,
              style: searchInputTextStyle,
              cursorColor: whiteColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                hintStyle: placeholderTextStyle,
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
            )),),
        )
      ],
    );
  }
}