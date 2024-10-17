// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../user_app/widgets/default_textfield.dart';

class DottedTextFields extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final bool? isButtonAdded;
  final dynamic borderColor;
  final dynamic buttonColor;
  final bool readonly;
   final ValueChanged<String?>? onChanged;
  const DottedTextFields(
      {super.key,
      required this.controller,
      required this.title,
      this.width,
      this.isButtonAdded,
      this.borderColor,
      this.buttonColor,
      required this.readonly,
       this.onChanged,});

  @override
  State<DottedTextFields> createState() => _DottedTextFieldsState();
}

class _DottedTextFieldsState extends State<DottedTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: addReservationLabelTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(8),
        ),
        Container(
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: whiteColor,
            ),
            child: DottedBorder(
                dashPattern: [10, 6],
                color: widget.borderColor,
                child: SizedBox(
                    height: 28,
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: widget.controller,
                      maxLines: 1,
                      readOnly: widget.readonly,
                      style: widget.borderColor == confirmColor
                          ? dottedTextFieldColoredInputTextStyle
                          : dottedTextFieldInputTextStyle,
                          onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(6, 4, 6, 6),
                        isDense: true,
                        hintStyle: placeholderTextStyle,
                        fillColor: blackColor,
                        prefixIcon: widget.isButtonAdded == true
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 7, 4),
                                child: Container(
                                    width: AppScreenUtil().screenWidth(15),
                                    decoration: BoxDecoration(
                                        color: widget.buttonColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                      child: Text('Add',
                                          style: dottedTextFieldPrefixTextStyle,
                                          textAlign: TextAlign.center),
                                    )),
                              )
                            : SizedBox(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    ))))
      ],
    );
  }
}
