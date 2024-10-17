// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/presentation/admin_app/widgets/reusable_text.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

class UserOutlinedTextField extends StatefulWidget {
  final dynamic maxLines;
  bool? isNumberField;
  final dynamic text;
  final double? textFieldSize;
  final String? errorMessage;
  final bool isValidData;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController controller;
  UserOutlinedTextField({
    super.key,
    this.maxLines,
    this.text,
    bool? isNumberField,
    this.textFieldSize = 32,
    this.errorMessage,
    this.isValidData = false,
    this.textInputFormatter,
    required this.controller,
  });

  @override
  State<UserOutlinedTextField> createState() => _UserOutlinedTextFieldState();
}

class _UserOutlinedTextFieldState extends State<UserOutlinedTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.textFieldSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  color: userOutlinedTextFieldBorderTextColor.withOpacity(0.6),
                  width: 0.8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: widget.text == 'Address'
                    ? AppScreenUtil().screenHeight(29)
                    : AppScreenUtil().screenHeight(32),
                width: AppScreenUtil().screenWidth(57),
                color: userOutlinedTextFieldBorderTextColor.withOpacity(0.23),
                child: Center(
                  child: Text(
                    widget.text,
                    style: kotDarkModeUnselectedTabLabelStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  maxLines: widget.maxLines,
                  keyboardType: widget.isNumberField == true
                      ? TextInputType.number
                      : TextInputType.text,
                  style: labelTextInputTextStyle,
                  controller: widget.controller,
                  inputFormatters: widget.textInputFormatter,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.all(6),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ],
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
