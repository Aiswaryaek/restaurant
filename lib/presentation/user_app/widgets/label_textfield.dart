// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class LabelTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  bool? isDate;
  bool? isTime;
  bool? isCustomer;
  bool? isNumberField;
  final dynamic maxLines;
  final dynamic onTap;
  final double? textFieldSize;
final double radius;
final List<TextInputFormatter>? textInputFormatter;
final String? errorMessage;
 final bool isValidData;
  LabelTextField(
      {super.key,
      required this.controller,
      this.labelText,
      this.isDate,
      this.isTime,
        this.isCustomer,
      this.isNumberField,
      this.onTap,
      this.maxLines,
      this.textFieldSize = 37,this.radius=13,this.textInputFormatter,this.errorMessage,this.isValidData = false});

  @override
  State<LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  @override
  Widget build(BuildContext context) {
    print(widget.controller.text);
    return Column(
      children: [
        SizedBox(
      height: widget.textFieldSize,
      child: TextField(
        readOnly: widget.labelText == 'Date'&&widget.labelText == 'Time'?true:false,
        maxLines: widget.maxLines,
        keyboardType: widget.isNumberField == true
            ? TextInputType.number
            : TextInputType.text,
        style: labelTextInputTextStyle,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isDate == true
              ? Container(
              width: AppScreenUtil().screenWidth(8),
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: SvgPicture.asset(
                      ImageCons.imgColoredCalender,height: 13,
                    ),
                  )):widget.isTime == true?Container(
              width: AppScreenUtil().screenWidth(8),
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: SvgPicture.asset(
                      ImageCons.imgClock,height: 13,color: confirmColor,
                    ),
                  )):widget.isCustomer == true?
          Container(
              width: AppScreenUtil().screenWidth(8),
              padding: const EdgeInsets.only(top: 5, bottom: 5,right: 12),
              child: GestureDetector(
                  onTap: widget.onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: confirmColor,
                        height: double.infinity,
                        width: AppScreenUtil().screenWidth(1.2),
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(8),),
                      Icon(Icons.add,color: confirmColor,size: 19,)
                    ],
                  )
              ))
              : SizedBox(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: addReservationLabelTextStyle,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: labelTextFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: labelTextFieldBorderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: labelTextFieldBorderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: labelTextFieldBorderColor),
          ),
        ),
      ),
    ),
    !widget.isValidData
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10.0),
                  child: Text(
                    widget.errorMessage ?? '',
                    style: errorInputTextStyle,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
