// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class StaffCompanyInfo extends StatefulWidget {
  const StaffCompanyInfo({super.key});

  @override
  State<StaffCompanyInfo> createState() => _StaffCompanyInfoState();
}

class _StaffCompanyInfoState extends State<StaffCompanyInfo> {
  final employeeIdController = TextEditingController();
  final designationController = TextEditingController();
  final dateOfLeavingController = TextEditingController();
  final workHoursController = TextEditingController();
  final typeController = TextEditingController();
  final dateOfJoiningController = TextEditingController();
  final monthlySalaryController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  bool status = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Employee ID',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Department',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        Row(
          children: [
            Expanded(
              child:CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Designation',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
                child: CustomTextFieldWithDate(
                  controller: dateOfJoiningController,
                  title: 'Date Of Joining',
                  onTap: () async {
                    dateSelection(controller: dateOfJoiningController);
                  },
                )),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextFieldWithDate(
                  controller: dateOfLeavingController,
                  title: 'Date Of Leaving',
                  onTap: () async {
                    dateSelection(controller: dateOfLeavingController);
                  },
                )),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: workHoursController, title: 'Work Hours'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(14),
        ),
        Row(
          children: [
            Expanded(
              child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Branches',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(child:  CommonDropDownWithTitle(
              dropDownItems: _dropdownItems,
              title: 'Allowed Branches',
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Text(
          'Salary',
          style: tableHeadingLabelStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: typeController, title: 'Type'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: CustomTextFieldWithTitle(
                  controller: monthlySalaryController,
                  title: 'Monthly salary'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Text(
          'Contract Period',
          style: tableHeadingLabelStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextFieldWithDate(
                  controller: fromController,
                  title: 'From',
                  onTap: () async {
                    dateSelection(controller: fromController);
                  },
                )),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
                child: CustomTextFieldWithDate(
                  controller: toController,
                  title: 'To',
                  onTap: () async {
                    dateSelection(controller: toController);
                  },
                )),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(20),
        ),
        Row(
          children: [
            Text('Status :',style: tableHeadingLabelStyle,),
            SizedBox(width: AppScreenUtil().screenWidth(10),),
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
            SizedBox(width: AppScreenUtil().screenWidth(10),),
            Text('Active / Inactive',style: takeAwayTextStyle,)
          ],
        )
      ],
    );
  }
}
