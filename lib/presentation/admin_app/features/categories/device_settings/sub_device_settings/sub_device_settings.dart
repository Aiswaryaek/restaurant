// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/device_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/attendance_device/attendance_device.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/payment_device/payment_device.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/printer/printer_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/scanning_device/scanning_device.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';

class SubDeviceSettings extends StatefulWidget {
  String tappedItem;

  SubDeviceSettings(this.tappedItem, {super.key});

  @override
  State<SubDeviceSettings> createState() => _SubDeviceSettingsState();
}

class _SubDeviceSettingsState extends State<SubDeviceSettings> {
  @override
  Widget build(BuildContext context) {
    return widget.tappedItem == 'Device Settings'
        ? DeviceSettings()
        : Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(16),
              right: AppScreenUtil().screenWidth(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                ///Filter button
                Transform.translate(
                  offset: Offset(0,-2),
                  child: SvgPicture.asset(
                    ImageCons.save,
                    height: 22,
                    width: 12,
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, -25),
                  child: Center(
                    child: Text(
                      'Device Settings',
                      style: btnTextStyle,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.tappedItem = 'Device Settings';
                              });
                            },
                            child: Text(
                              'Device Settings',
                              style: taxCreateEnterAPassWordLabelStyle,
                            ),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(2),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: blackColor,
                            size: 10,
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(4),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.tappedItem = 'Device Settings';
                                  });
                                },
                                child: Text(
                                  widget.tappedItem,
                                  style: gridTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(child: widget.tappedItem == 'Printer'
              ? PrinterScreen()
              : widget.tappedItem == 'Attendance Device'
              ? AttendanceDevice()
              : widget.tappedItem == 'Payment Device'
              ? PaymentDevice()
              : widget.tappedItem == 'Scanning Device'
              ? ScanningDevice()
              : Text('Last Item')))

        ]),)
      ],
    );
  }
}