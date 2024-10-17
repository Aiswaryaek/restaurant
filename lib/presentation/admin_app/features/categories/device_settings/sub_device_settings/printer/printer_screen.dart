// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/printer/tabs/barcode_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/printer/tabs/paper_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/sub_device_settings/printer/tabs/receipt_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/back_up_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/clear_data_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/restore_tab.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class PrinterScreen extends StatefulWidget {
  const PrinterScreen({super.key});

  @override
  State<PrinterScreen> createState() => _PrinterScreenState();
}

class _PrinterScreenState extends State<PrinterScreen> {
  String selectedTab = 'Receipt';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16)),
      child: Column(
        children: [
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(selectedTab == 'Receipt' ? 10 : 0),
                bottomRight:
                    Radius.circular(selectedTab == 'Barcode' ? 10 : 0),
              ),
              child: Container(
                ///Tab underline container
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: blackColor, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    ///Receipt Tab
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Receipt';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Receipt')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Receipt',
                              style: (selectedTab == 'Receipt')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///Restore Tab
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Paper';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Paper')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Paper',
                              style: (selectedTab == 'Paper')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///Barcode tab
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Barcode';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Barcode')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Barcode',
                              style: (selectedTab == 'Barcode')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: AppScreenUtil().screenHeight(23),
          // ),

          ///Receipt layout
          (selectedTab == 'Receipt')
              ? ReceiptTab()
              : (selectedTab == 'Paper')
                  ? PaperTab()
                  : BarcodeTab()
        ],
      ),
    );
  }
}
