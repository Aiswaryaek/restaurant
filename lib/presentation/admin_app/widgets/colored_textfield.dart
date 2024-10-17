// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/presentation/admin_app/widgets/reusable_text.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ColoredTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final dynamic width;
  final dynamic color;
  final dynamic hint;
  final dynamic sufixIcon;
  final bool readOnly;
  final bool titleVisibility;
  final TextStyle? textStyle;
  final double textFieldHeight;
  final dynamic maxLines;
  final String? errorMessage;
  final bool isValidData;
  final TextStyle? errorMsgTextStyle;
  final List<TextInputFormatter>? textInputFormatter;
final TextInputType? keyboardType;
  const ColoredTextField({
    super.key,
    required this.controller,
    this.titleVisibility = true,
    this.readOnly = false,
    this.maxLines,
    this.textStyle,
    required this.title,
    this.sufixIcon,
    this.width,
    this.color,
    this.hint,
    this.textFieldHeight = 35.5,
    this.errorMessage,
    this.isValidData = false,
    this.errorMsgTextStyle,
    this.textInputFormatter,
    this.keyboardType,
  });

  @override
  State<ColoredTextField> createState() => _ColoredTextFieldState();
}

class _ColoredTextFieldState extends State<ColoredTextField> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      print('1: ${focusNode.hasFocus}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.titleVisibility,
          child: Column(
            children: [
              Text(
                widget.title,
                style: widget.textStyle ?? bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
            ],
          ),
        ),
        Container(
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.color,
              border: Border.all(color: widget.color, width: 3)),
          child: SizedBox(
              height: widget.textFieldHeight,
              child: TextFormField(
                keyboardType: widget.keyboardType,
                inputFormatters: widget.textInputFormatter,
                maxLines: widget.maxLines,
                focusNode: focusNode,
                controller: widget.controller,
                style: searchInputTextStyle,
                readOnly: widget.readOnly,
                cursorColor: whiteColor,
                decoration: InputDecoration(
                  suffixIcon: widget.sufixIcon,
                  contentPadding: EdgeInsets.all(7),
                  isDense: true,
                  hintText: widget.hint,
                  hintStyle: loremTextStyle,
                  fillColor: blackColor,
                  focusColor: widget.color,
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
        ),
        !widget.isValidData
            ? Transform.translate(offset: Offset(-8,-11),child: ReusableErrorText(
          errorText: widget.errorMessage ?? '',
          fontSize: 10,
          textStyle: widget.errorMsgTextStyle,
        ),)
            : const SizedBox(),
      ],
    );
  }
}
