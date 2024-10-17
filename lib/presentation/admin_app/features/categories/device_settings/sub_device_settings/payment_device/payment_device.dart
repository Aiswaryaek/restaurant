// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../user_app/widgets/custom_button.dart';

class PaymentDevice extends StatefulWidget {
  const PaymentDevice({super.key});

  @override
  State<PaymentDevice> createState() => _PaymentDeviceState();
}

class _PaymentDeviceState extends State<PaymentDevice> {
  String? _selectedItem;
  final List<String> _dropdownItems = [
    'HP Laser jet 400 M401',
    'HP Laser jet 400 M200',
    'HP Laser jet 400 M350'
  ];

  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(14),
  );
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredDropDown(isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'POS',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),

          SizedBox(
            height: AppScreenUtil().screenHeight(22),
          ),

          ///Horizontal line
          Container(
            height: AppScreenUtil().screenHeight(0.5),
            color: attendanceDeviceDividerColor,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: TextEditingController(),
              title: 'App Key'),
          constHeight,

          ColoredTextField(
              color: textFieldColor,
              controller: TextEditingController(),
              title: 'User Name'),
          constHeight,
          ColoredTextField(
              color: textFieldColor,
              controller: TextEditingController(),
              title: 'Password'),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          Align(
              alignment: Alignment.topRight,
              child: CustomButton(
                  buttonHeight: AppScreenUtil().screenHeight(24),
                  buttonWidth: AppScreenUtil().screenWidth(83),
                  buttonColor: blackColor,
                  borderRadius: 10.0,
                  buttonText: 'Submit',
                  buttonLabelStyle:
                  backupAndRestoreSubmitButtonLabelStyle))
        ],
      ),
    );
  }
}
