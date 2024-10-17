// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/coloredDateField.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';

class OutletAddExpense extends StatefulWidget {
  const OutletAddExpense({super.key});

  @override
  State<OutletAddExpense> createState() => _OutletAddExpenseState();
}

class _OutletAddExpenseState extends State<OutletAddExpense> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final dateInput = TextEditingController();
  final lastPaidDateController = TextEditingController();
  final docNoController = TextEditingController();
  final amountController = TextEditingController();
  final creditAmountController = TextEditingController();
  final lastPaidAmountController = TextEditingController();
  final notesController = TextEditingController();
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
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 5, 25, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add Outlet Expense',
              style: tableTitleLabelStyleForEmployeeDashBoard,
            ),
          ),
          SizedBox(height: AppScreenUtil().screenHeight(20),),
          ColoredTextField(
              color: textFieldColor,
              controller: docNoController,
              title: 'Doc No'),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredDropDown(
            isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Branch',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredDropDown(
            isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Expense Type',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredDateField(
            controller: dateInput,
            title: 'Date',
            onTap: () async {
              dateSelection(controller: dateInput);
            },
          ),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredTextField(
              color: textFieldColor,
              controller: amountController,
              title: 'Amount'),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredDropDown(
            isVisible: true,
            dropDownItems: _dropdownItems,
            title: 'Payment Type',
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredTextField(
              color: textFieldColor,
              controller: creditAmountController,
              title: 'Credit Amount'),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredTextField(
              color: textFieldColor,
              controller: lastPaidAmountController,
              title: 'Last Paid Amount'),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredDateField(
            controller: lastPaidDateController,
            title: 'Last Paid Date',
            onTap: () async {
              dateSelection(controller: dateInput);
            },
          ),
          SizedBox(height: AppScreenUtil().screenHeight(16),),
          ColoredTextField(
              color: textFieldColor,
              controller: notesController,
              title: 'Notes'),
          SizedBox(height: AppScreenUtil().screenHeight(30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 83,
                  height: 24,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(color: blackColor)),
                  padding: EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Cancel',
                        style: categoryMenuTextStyle,
                        textAlign: TextAlign.center),
                  )),
              SizedBox(
                width: AppScreenUtil().screenWidth(8),
              ),
              InkWell(
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: confirmTextStyle,
                          textAlign: TextAlign.center),
                    )),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}