// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/roles_and_permission_settings/tabs/designation_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/roles_and_permission_settings/tabs/employe_tab.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class RolesAndPermissionSettings extends StatefulWidget {
  const RolesAndPermissionSettings({super.key});

  @override
  State<RolesAndPermissionSettings> createState() =>
      _RolesAndPermissionSettingsState();
}

class _RolesAndPermissionSettingsState
    extends State<RolesAndPermissionSettings> {
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  String tab1 = 'Designation';
  String tab2 = 'Employee';
  dynamic item = 'Designation';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: tappedTab1 == true ? blackColor : whiteColor,
                      borderRadius: BorderRadius.circular(11)),
                  height: 24,
                  width: 101,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab1,
                        style: tappedTab1 == true
                            ? cartSelectedTabLabelTextStyle
                            : categoryMenuTextStyle,
                        textAlign: TextAlign.center),
                  )),
              onTap: () {
                setState(() {
                  item = tab1;
                  tappedTab1 = true;
                  tappedTab2 = false;
                });
              },
            ),
            SizedBox(
              width: AppScreenUtil().screenWidth(2),
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: tappedTab2 == true ? blackColor : whiteColor,
                      borderRadius: BorderRadius.circular(11)),
                  height: 24,
                  width: 101,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(tab2,
                        style: tappedTab2 == true
                            ? cartSelectedTabLabelTextStyle
                            : categoryMenuTextStyle,
                        textAlign: TextAlign.center),
                  )),
              onTap: () {
                setState(() {
                  item = tab2;
                  tappedTab1 = false;
                  tappedTab2 = true;
                });
              },
            )
          ],
        ),
        Transform.translate(
            offset: Offset(0, -9),
            child: Padding(
              padding: EdgeInsets.only(left: 86, right: 86),
              child: Divider(
                color: blackColor,
                thickness: 1.5,
              ),
            )),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),

        ///Designation layout
        item == 'Designation' ? DesignationTab() : EmployeeTab()
      ],
    );
  }
}
