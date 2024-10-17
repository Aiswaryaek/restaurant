// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/overtime/create/add_overtime.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/inventory_table_layout_without_scroll.dart';

class SalaryDisbursement extends StatefulWidget {
  const SalaryDisbursement({super.key});

  @override
  State<SalaryDisbursement> createState() => _SalaryDisbursementState();
}

class _SalaryDisbursementState extends State<SalaryDisbursement> {
  final paymentMethodController = TextEditingController();
  final accountingDateController = TextEditingController();
  final paymentTypeController = TextEditingController();
  final refDateController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  bool overTimeContainer = false;
  bool onTapped = false;

  List<String> employee = [
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
    'EMP054-Vaisak',
  ];
  List<String> netSalary = [
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
    '3500.00',
  ];

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

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    whiteColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'SAL DIS/2023/10/0001',
              style: billTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: paymentMethodController,
                    title: 'Payment Method'),
              ),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                child: CustomTextFieldWithTitle(
                    controller: accountingDateController,
                    title: 'Accounting Date'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(14),
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: paymentTypeController,
                title: 'Payment Type',
                onTap: () async {
                  dateSelection(controller: paymentTypeController);
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(
                  child: CustomTextFieldWithDate(
                controller: refDateController,
                title: 'Ref',
                onTap: () async {
                  dateSelection(controller: refDateController);
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
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Tax No.',
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
                title: 'Tax Date',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
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
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Branch',
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
                title: 'Department',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
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
                  child: CommonDropDownWithTitle(
                dropDownItems: _dropdownItems,
                title: 'Establishment',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              )),
              SizedBox(width: AppScreenUtil().screenWidth(25)),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Divider(
            color: inventorySelectionColor,
            thickness: 1.5,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(8),
          ),
          InventoryTableLayoutWithoutScroll(
              scrollIndicatorVisibility: false,
              tableDataWidgets: List.generate(employee.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(350),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(18)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            employee[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        netSalary[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
              tableRowWidth: 350,
              titleWidgets: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Employee',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Net Salary',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
          Padding(
              padding: EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
              child: Container(
                  height: AppScreenUtil().screenHeight(36),
                  width: AppScreenUtil().screenWidth(350),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: salaryDisbursementBottomContainerColor,
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(18)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Total',style: dashBoardTextStyle,),
                           SizedBox(width: AppScreenUtil().screenWidth(70),),
                           Align(
                               alignment: Alignment.centerRight,
                               child: Container(
                               height:double.infinity,
                               child:  Center(
                                 child: Text('35000.00',style: dashBoardTextStyle,),
                               )
                           ))
                          ])))),
        ],
      ),
    );
  }
}
