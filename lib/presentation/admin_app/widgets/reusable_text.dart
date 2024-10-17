import 'package:flutter/material.dart';
import 'package:restaurant/styles/textstyles.dart';

class ReusableErrorText extends StatelessWidget {
  const ReusableErrorText(
      {Key? key, this.errorText = 'Enter a valid data', this.fontSize,this.textStyle})
      : super(key: key);
  final String errorText;
  final double? fontSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top:13,left: 10.0),
        child: Text(
          errorText,
          style:textStyle,
        ),
      ),
    );
  }
}