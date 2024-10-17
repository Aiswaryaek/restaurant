
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/colored_textfield.dart';

class PayrollSettings extends StatefulWidget {
  const PayrollSettings({super.key});

  @override
  State<PayrollSettings> createState() => _PayrollSettingsState();
}

class _PayrollSettingsState extends State<PayrollSettings> {
  String? selectedSalaryJournal;
  final List<String> salaryJournal = ['01', '02', '03'];
  final dayFromController = TextEditingController();
  final dayToController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Salary Period',style: tableTitleLabelStyleForEmployeeDashBoard,),
          SizedBox(
            height: AppScreenUtil().screenHeight(12),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: dayFromController,
              title: 'Day From'),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          ColoredTextField(
              color: textFieldColor,
              controller: dayToController,
              title: 'Day To'),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),
          Text('Salary Journal',style: tableTitleLabelStyleForEmployeeDashBoard,),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          ColoredDropDown(  isVisible: false,
            dropDownItems: salaryJournal,
            title: 'Salary Journal',
            value: selectedSalaryJournal,
            onChanged: (String? newValue) {
              setState(() {
                selectedSalaryJournal = newValue;
              });
            },
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),
          Text('Salary Payable A/C',style: tableTitleLabelStyleForEmployeeDashBoard,),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          ColoredDropDown(
            isVisible: false,
            dropDownItems: salaryJournal,
            title: 'Salary Payable A/C',
            value: selectedSalaryJournal,
            onChanged: (String? newValue) {
              setState(() {
                selectedSalaryJournal = newValue;
              });
            },
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),
          Text('Staff Loan A/C',style: tableTitleLabelStyleForEmployeeDashBoard,),
          SizedBox(
            height: AppScreenUtil().screenHeight(10),
          ),
          ColoredDropDown(  isVisible: false,
            dropDownItems: salaryJournal,
            title: 'Staff Loan a/c',
            value: selectedSalaryJournal,
            onChanged: (String? newValue) {
              setState(() {
                selectedSalaryJournal = newValue;
              });
            },
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
        ],
      ),
    );
  }
}
