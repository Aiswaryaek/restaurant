// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/sub_device_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/sub_settings.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../widgets/common_drop_down_with_title.dart';

class DeviceSettings extends StatefulWidget {
  const DeviceSettings({super.key});

  @override
  State<DeviceSettings> createState() => _DeviceSettingsState();
}

class _DeviceSettingsState extends State<DeviceSettings> {
  int? tappedSettings;
  final deviceSettings = <ProductCategoriesModel>[];
  dynamic currentTab;
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];

  @override
  void initState() {
    deviceSettings.add(ProductCategoriesModel('Printer',ImageCons.imgPrinter));
    deviceSettings.add(ProductCategoriesModel('Attendance Device',ImageCons.imgDeviceAttendanceDevice));
    deviceSettings.add(ProductCategoriesModel('Payment Device',ImageCons.imgDevicePaymentDevice));
    deviceSettings.add(ProductCategoriesModel('Scanning Device',ImageCons.imgDeviceScanner));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Printer' ||
        currentTab == 'Attendance Device' ||
        currentTab == 'Payment Device' ||
        currentTab == 'Scanning Device'
        ? SubDeviceSettings(currentTab)
        :  Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
        // height: 600,
        width: double.infinity,
        // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                tabPageLeftGradientColor,
                tabPageRightGradientColor,
              ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
      children: [
        SizedBox(height: AppScreenUtil().screenHeight(25),),
        Expanded(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(0,-2),
                child: Text(
                  'Device Settings',
                  style: dashBoardLabelTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Padding(padding: EdgeInsets.only(left: 10),child: Text(
                'Branch',
                style: confirmTextStyle,
              ),),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Container(
                height: 37,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                  color: tabSelectionAColor
                      .withOpacity(0.20),),
                child: DropdownButton<String>(style: searchInputTextStyle,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10),
                  value: selected,
                  items: _dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: subTitleTextStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selected = newValue;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: whiteColor,
                  ),
                  iconSize: 20,
                  isExpanded: true,
                  underline:
                  const SizedBox(), // Removes the default underline
                ),
              ),),
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                children: List<Widget>.generate(deviceSettings.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedSettings = index;
                          currentTab = deviceSettings[index].text;
                        });
                        print('current Tab :$currentTab');
                      },
                      child: Container(
                        width: AppScreenUtil().screenWidth(80),
                        color: Colors.transparent,
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.5),
                              height: AppScreenUtil().screenHeight(38),
                              width: AppScreenUtil().screenWidth(47),
                              decoration: BoxDecoration(
                                color: tabSelectionAColor
                                    .withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:
                              SvgPicture.asset(deviceSettings[index].icon,color: whiteColor,),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Center(
                              child: Text(
                                deviceSettings[index].text.toString(),textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                                style:
                                clearDataAlertYesButtonLabelStyle,
                              ),
                            )
                          ],
                        ),
                      ));
                }).toList(),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
