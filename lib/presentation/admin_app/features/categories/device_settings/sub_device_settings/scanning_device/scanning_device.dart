// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../user_app/widgets/custom_button.dart';

class ScanningDevice extends StatefulWidget {
  const ScanningDevice({super.key});

  @override
  State<ScanningDevice> createState() => _ScanningDeviceState();
}

class _ScanningDeviceState extends State<ScanningDevice> {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredDropDown(isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Select QR Code Device',
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

          ColoredDropDown(isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Select Barcode Device',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
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
