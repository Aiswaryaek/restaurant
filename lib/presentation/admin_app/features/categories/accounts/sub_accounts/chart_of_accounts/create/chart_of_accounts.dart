// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class ChartOfAccounts extends StatefulWidget {
  const ChartOfAccounts({super.key});

  @override
  State<ChartOfAccounts> createState() => _ChartOfAccountsState();
}

class _ChartOfAccountsState extends State<ChartOfAccounts> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final codeController = TextEditingController();
  final accountNameController = TextEditingController();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: codeController, title: 'Code')),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithTitle(
                      controller: accountNameController, title: 'Account Name'))
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Type',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Branch',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ))
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(18),
          ),
          Text(
            'Active / InActive',
            style: bookedTextStyle,
          ),
          SizedBox(height: AppScreenUtil().screenHeight(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterSwitch(
                width: 43,
                height: 18,
                toggleSize: 11.0,
                value: status,
                borderRadius: 60.0,
                padding: 2.0,
                toggleColor: status== false?confirmColor:greenColor,
                switchBorder: Border.all(
                  color: status== false?confirmColor:greenColor,
                  width: 1,
                ),
                toggleBorder: Border.all(
                  color: status== false?confirmColor:greenColor,
                  width: 1,
                ),
                activeColor: whiteColor,
                inactiveColor: whiteColor,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
