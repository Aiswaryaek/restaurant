// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/inventory_table_layout_without_scroll.dart';
import '../../../../../widgets/reason_textfield.dart';
import '../../../../../widgets/settings_check_box_with_label.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  String tab1 = 'Costing Method';
  String tab2 = 'Currency Configuration';
  dynamic item = 'Costing Method';
  bool tappedTab1 = true;
  bool tappedTab2 = false;
  final List<String> _dropdownItems = ['Average', 'Fixed'];
  final List<String> averageItems = ['10', '20'];
  String? _selectedItem;
  String? selectedAverage;
  String? averageSelected;
  List<Color> tableDataAlternateColor = [
    textFieldColor,
    whiteColor,
  ];

  int _selectedRadio = 0;

  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
  }
  bool isChecked = false;

  final templateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: tappedTab1 == true
                            ? blackColor
                            : whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    height: 24,
                    width: 105,
                    padding: EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tab1,
                          style: tappedTab1 == true
                              ? backupAndRestoreSubmitButtonLabelStyle
                              : clearDataAlertNoButtonLabelStyle,
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
              SizedBox(width: AppScreenUtil().screenWidth(2),),
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: tappedTab2 == true
                            ? blackColor
                            : whiteColor,
                        borderRadius: BorderRadius.circular(11)),
                    height: 24,
                    // width: 105,
                    padding: EdgeInsets.only(bottom: 2, left: 3, right: 3),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(tab2,
                          style: tappedTab2 == true
                              ? backupAndRestoreSubmitButtonLabelStyle
                              : clearDataAlertNoButtonLabelStyle,
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
                padding: EdgeInsets.only(left: 60, right: 60),
                child: Divider(
                  color: blackColor,
                  thickness: 1.5,
                ),
              )),
          SizedBox(height: AppScreenUtil().screenHeight(10),),
          item == 'Costing Method' ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Cost Type',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                    averageSelected = _selectedItem;
                  });
                },
              ),
              averageSelected == 'Average' ? ColoredDropDown(isVisible: true,
                dropDownItems: averageItems,
                title: '',
                value: selectedAverage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAverage = newValue;
                  });
                },
              ):SizedBox(),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
            ],
          ) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Currency',style: bookedTextStyle,),
              SizedBox(height: AppScreenUtil().screenHeight(10),),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 20.26,
                      height: 19,
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        color: isChecked ? constantWhite : Colors.transparent,
                      ),
                      child: isChecked
                          ?Padding(
                        padding: const EdgeInsets.all(4),
                        child: SvgPicture.asset(ImageCons.imgCheckboxTikMark,width: 11.92,height: 9.13,),
                      )
                          : null,
                    ),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(15)),
                  Text(
                    'Multi Currency',
                    style: settingsCheckBoxLabelStyle,
                  ),
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
