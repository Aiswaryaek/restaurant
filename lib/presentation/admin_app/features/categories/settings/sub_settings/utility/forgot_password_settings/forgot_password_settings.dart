// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/colored_phone_field.dart';
import '../../../../../../widgets/colored_textfield.dart';

class ForgotPasswordSettings extends StatefulWidget {
  const ForgotPasswordSettings({super.key});

  @override
  State<ForgotPasswordSettings> createState() => _ForgotPasswordSettingsState();
}

class _ForgotPasswordSettingsState extends State<ForgotPasswordSettings> {
  int _selectedRadio = 0;

  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    activeColor: blackColor,
                    focusColor: blackColor,
                    value: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: _selectedRadio,
                    visualDensity: VisualDensity.compact,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(
                    'Email',
                    style: bookedTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    activeColor: blackColor,
                    focusColor: blackColor,
                    value: 1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: _selectedRadio,
                    visualDensity: VisualDensity.compact,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(
                    'Question & Answers',
                    style: bookedTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    activeColor: blackColor,
                    focusColor: blackColor,
                    value: 2,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: _selectedRadio,
                    visualDensity: VisualDensity.compact,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(
                    'SMS',
                    style: bookedTextStyle,
                  ),
                ],
              ),
            ],
          ),
          _selectedRadio == 0
              ? Column(
                  children: [
                    ColoredTextField(hint: 'Mun45@gmail.com',
                        color: textFieldColor,
                        controller: emailController,
                        title: ''),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: 83,
                            height: 24,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: blackColor)),
                            padding: EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Cancel',
                                  style: categoryMenuTextStyle,
                                  textAlign: TextAlign.center),
                            )),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(8),
                        ),
                        Container(
                            width: 83,
                            height: 24,
                            decoration: BoxDecoration(
                                color: blackColor,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: blackColor)),
                            padding: EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Submit',
                                  style: confirmTextStyle,
                                  textAlign: TextAlign.center),
                            )),
                      ],
                    )
                  ],
                )
              : _selectedRadio == 1
                  ? Column(
            children: [
              SizedBox(
                height: AppScreenUtil().screenHeight(22),
              ),
              Container(
                  padding:
                  EdgeInsets.only(right: 10, left: 15, top: 12),
                  height: 41,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: textFieldColor),
                  child: Text(
                    'Lorumipsum dummy text ?',
                    style: loremTextStyle,
                  )),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Container(
                height: 43,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    border: Border.all(
                        color: rolesAndPermissionsDropDownBorderColor
                            .withOpacity(0.01))),
                child: TextField(
                  maxLines: 10,
                  controller: questionController,
                  style: searchInputTextStyle,
                  cursorColor: whiteColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintStyle: placeholderTextStyle,
                    fillColor: blackColor,
                    focusColor: blackColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blackColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blackColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blackColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blackColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Clear',
                            style: categoryMenuTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(8),
                  ),
                  Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Submit',
                            style: confirmTextStyle,
                            textAlign: TextAlign.center),
                      )),
                ],
              )
            ],
          )
                  : Column(
            children: [
              ColoredPhoneField(hint: '8086745473',
                  color: textFieldColor,
                  controller: emailController,
                  title: ''),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Cancel',
                            style: categoryMenuTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(8),
                  ),
                  Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Submit',
                            style: confirmTextStyle,
                            textAlign: TextAlign.center),
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
