// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

TextField buildTextFormField(StateSetter setState, String _labelText,
    String _hintText, String _errorText, bool _isObscure,TextEditingController _controller){

  String labelText = "";
  return TextField(
    controller: _controller,
    style: textInputTextStyle,
    cursorColor: whiteColor,
    obscureText: _isObscure,
    onChanged: (v) {
      setState(() {
        _labelText = v.isNotEmpty ? labelText : "";
      });
    },
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(15),
      isDense: true,
      errorText: _controller.text == '' ? _errorText : '',
      labelText: _labelText,
      labelStyle: labelTextStyle,
      hintText: _hintText,
      hintStyle: placeholderTextStyle,
      fillColor: blackColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
    ),
  );
}
