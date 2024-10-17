// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';

class LoanEligibility extends StatefulWidget {
  const LoanEligibility({super.key});

  @override
  State<LoanEligibility> createState() => _LoanEligibilityState();
}

class _LoanEligibilityState extends State<LoanEligibility> {
 final minimumSalaryController = TextEditingController();
 final outstandingAmountController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Column(
        children: [
          Row(
            children: [
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
                  )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
             Expanded(child:  CustomTextFieldWithTitle(
                 controller: minimumSalaryController, title: 'Minimum Salary'),),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(child:  CustomTextFieldWithTitle(
                  controller: minimumSalaryController, title: 'Outstanding amount'),),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
