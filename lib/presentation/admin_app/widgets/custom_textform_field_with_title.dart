import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/presentation/admin_app/widgets/reusable_text.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomTextFormFieldWithTitle extends StatefulWidget {
  final TextEditingController? controller;
  final String textFieldTitle;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final Key? formKey;
  final TextInputType? keyboardType;

  final Widget? sufixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final Function(String?)? validator;
  final bool isValidData;
  final String? errorMessage;
  const CustomTextFormFieldWithTitle(
      {super.key,
      this.textInputFormatter,
      this.formKey,
      this.validator,
      this.keyboardType,
      this.errorMessage,
      this.isValidData = true,
      this.readOnly = false,
      this.sufixIcon,
      required this.textFieldTitle,
      this.controller,
      this.hintStyle,
      this.hintText});

  @override
  State<CustomTextFormFieldWithTitle> createState() =>
      _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState
    extends State<CustomTextFormFieldWithTitle> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.textFieldTitle,
            style: branchSettingsTextFieldTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(6),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(30),
          width: double.infinity,
          child: Form(
            key: widget.formKey,
            child: TextFormField(
              inputFormatters: widget.textInputFormatter,
              readOnly: widget.readOnly,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              style: const TextStyle(color: Colors.black), // Text color
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                filled: true,
                fillColor: whiteColor, 
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(8),
                  horizontal: AppScreenUtil().screenWidth(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0), // Set border radius
                  borderSide:const BorderSide(
                    color: redColor, // Change border color
                    width: 1.0, // Border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:const BorderSide(
                    color: redColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:const BorderSide(
                    color: redColor,
                    width: 1.0,
                  ),
                ),
                labelStyle: customTextFieldLabelStyle,
                suffixIcon: widget.sufixIcon,
              ),
              validator: (value) {
                widget.validator!(value);
                return null;
              },
            ),
          ),
        ),
        !widget.isValidData
            ? ReusableErrorText(
                errorText: widget.errorMessage ?? '',
              )
            : const SizedBox(),
      ],
    );
  }
}
