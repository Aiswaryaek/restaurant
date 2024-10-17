import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/presentation/admin_app/widgets/reusable_text.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextStyle? textInputTextStyle;
  final bool isObscure;
  final Function(String)? onChanged;
  final String? errorText;
  final String? labelText;

  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
    final String? errorMessage;
final bool isValidData;
final Color? errorTextColor;
final TextStyle? errorMsgTextStyle;
final bool readOnly;
final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField({
    super.key,
    this.controller,
    this.textInputTextStyle,
    this.isObscure = false,
    this.onChanged,
    this.errorText,
    this.labelText,
    this.labelTextStyle,
    this.hintText,
    this.hintTextStyle,
    this.errorMessage,
    this.isValidData = false,
    this.textInputFormatter,
    this.errorTextColor,
    this.readOnly = false,
    this.errorMsgTextStyle
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppScreenUtil().screenHeight(32),
          child: TextField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            style: widget.textInputTextStyle,
            cursorColor: whiteColor,
            obscureText: widget.isObscure,
            onChanged: widget.onChanged,
            inputFormatters:widget.textInputFormatter,
            decoration: InputDecoration(
              
              contentPadding: const EdgeInsets.all(15),
              isDense: true,
              errorText: widget.errorText,
              labelText: widget.labelText,
              labelStyle: widget.labelTextStyle,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle,
              fillColor: blackColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: whiteColor),
              ),
            ),
          ),
        ),
        !widget.isValidData
                  ?  ReusableErrorText(
                      errorText: widget.errorMessage ?? '',
                      fontSize: 13,
                      textStyle: widget.errorMsgTextStyle,
                    )
                  : const SizedBox(),
      ],
    );
  }
}
