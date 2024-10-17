import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/Custom_drop_down_button.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_check_box.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_checkbox_and_drop_down.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class PosSettings extends StatefulWidget {
  const PosSettings({super.key});

  @override
  State<PosSettings> createState() => _PosSettingsState();
}

class _PosSettingsState extends State<PosSettings> {
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(13),
  );
  final List<String> dropDownItems = [
    '012',
    '013',
    '014',
    '015',
  ];
  String selectedDropDown = '012';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppScreenUtil().screenWidth(16),
          right: AppScreenUtil().screenWidth(16),
          bottom: AppScreenUtil().screenHeight(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonCheckBox(
                borderColor: blackColor,
                borderRadius: BorderRadius.circular(1),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(16),
              ),
              Text(
                'POS Accounts',
                style: posSettingsTitleStyle,
              )
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(25),
          ),
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'POS Receivable',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),
          constHeight,
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'POS Income',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),
          constHeight,
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'POS Discount',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),
          constHeight,
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'POS Bank Charges',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),
          constHeight,
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'Delivery Charges',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),
          constHeight,
          CustomDropDownButton(
            titleLabelStyle: posSettingsSubTitleStyle(null),
            title: 'POS Journal',
            value: selectedDropDown,
            dropdownItems: dropDownItems,
            onChanged: (v) {
              selectedDropDown = v.toString();
              setState(() {});
            },
          ),

          ///Petty cash layout
          CustomCheckBoxAndDropDown(
              checkboxTitle: 'Petty Cash',
              dropDownTitle: 'Petty Cash Journal',
              dropdownItems: dropDownItems,
              onChanged: (v) {
                selectedDropDown = v.toString();
                setState(() {});
              },
              value: selectedDropDown),

          ///Cash in or out layout
          CustomCheckBoxAndDropDown(
              checkboxTitle: 'Cash In or Out',
              dropDownTitle: 'Cash In or Out Account',
              dropdownItems: dropDownItems,
              onChanged: (v) {
                selectedDropDown = v.toString();
                setState(() {});
              },
              value: selectedDropDown),

          ///Active wallet layout
          CustomCheckBoxAndDropDown(
              checkboxTitle: 'Active Wallet',
              dropDownTitle: 'Wallet Journal',
              dropdownItems: dropDownItems,
              onChanged: (v) {
                selectedDropDown = v.toString();
                setState(() {});
              },
              value: selectedDropDown),

          ///Active loyalty layout
          CustomCheckBoxAndDropDown(
              checkboxTitle: 'Active Loyalty',
              dropDownTitle: 'Loyalty Journal',
              dropdownItems: dropDownItems,
              onChanged: (v) {
                selectedDropDown = v.toString();
                setState(() {});
              },
              value: selectedDropDown),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonCheckBox(
                borderColor: blackColor,
                borderRadius: BorderRadius.circular(1),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(16),
              ),
              Text(
                'Negative Stock',
                style: posSettingsTitleStyle,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
