// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/colored_dropdown.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool status = true;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 5, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Enable Stand',
                    style: taxCreateEnterAPassWordLabelStyle,
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(5),
                  ),
                  FlutterSwitch(
                    width: 35,
                    height: 16,
                    toggleSize: 10.0,
                    value: status,
                    borderRadius: 60.0,
                    padding: 2.0,
                    toggleColor: status == false ? confirmColor : greenColor,
                    switchBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
                      width: 1,
                    ),
                    toggleBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Enable by Product',
                    style: taxCreateEnterAPassWordLabelStyle,
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(5),
                  ),
                  FlutterSwitch(
                    width: 35,
                    height: 16,
                    toggleSize: 10.0,
                    value: status,
                    borderRadius: 60.0,
                    padding: 2.0,
                    toggleColor: status == false ? confirmColor : greenColor,
                    switchBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
                      width: 1,
                    ),
                    toggleBorder: Border.all(
                      color: status == false ? confirmColor : greenColor,
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
              ),
            ],
          ),
          SizedBox(height: AppScreenUtil().screenHeight(20),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               'Work In Progress Account',
                style:subTitleTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Container(
                height: AppScreenUtil().screenHeight(36),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: textFieldColor),
                child: DropdownButton<String>(style: searchInputTextStyle,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10),
                  value: _selectedItem,
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
                      _selectedItem = newValue;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: blackColor,
                  ),
                  iconSize: 20,
                  isExpanded: true,
                  underline:
                  const SizedBox(), // Removes the default underline
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
