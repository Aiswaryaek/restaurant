// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/coloredDateField.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/custom_text_field_with_date.dart';

class Gl_Configuration extends StatefulWidget {
  const Gl_Configuration({super.key});

  @override
  State<Gl_Configuration> createState() => _Gl_ConfigurationState();
}

class _Gl_ConfigurationState extends State<Gl_Configuration> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final dateInput = TextEditingController();
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
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.8,
        child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Inventory',
                style: tableTitleLabelStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Stock Journal',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Stock Valuation Account',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Stock Adjustment Account',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Goods Internal Transfer',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
                  Text(
                    'Purchase',
                    style: tableTitleLabelStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Purchase Journal',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Purchase Control Acount',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Purchase Discount',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  Text(
                    'Sales',
                    style: tableTitleLabelStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Sales Journal',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Sales Expenses Account',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Income Account',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Sales Discount',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  Text(
                    'Accounts',
                    style: tableTitleLabelStyle,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Default Payable',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Default Receivable',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ColoredDropDown(isVisible: true,
                        dropDownItems: _dropdownItems,
                        title: 'Currency Decimal Points',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ),),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ColoredDropDown(isVisible: true,
                        dropDownItems: _dropdownItems,
                        title: 'Stock Decimal Points',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      ),),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ColoredDateField(
                          controller: dateInput,
                          title: 'Financial Year End Date',
                          onTap: () async {
                            dateSelection(controller: dateInput);
                          },
                          ),),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ColoredDateField(
                        controller: dateInput,
                        title: 'Accounts Lock Date',
                        onTap: () async {
                          dateSelection(controller: dateInput);
                        },
                      ),),
                      Expanded(child: Container()),
                    ],
                  )
            ])));
  }
}
