// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/editableTable.dart';

class AccountPayable extends StatefulWidget {
  const AccountPayable({super.key});

  @override
  State<AccountPayable> createState() => _AccountPayableState();
}

class _AccountPayableState extends State<AccountPayable> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final dateInput = TextEditingController();
  final referenceController = TextEditingController();
  List<String> account = [
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
  ];
  List<String> partner = [
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
    'Company',
  ];
  List<String> employee = [
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
    'Name Of Employee',
  ];
  List<String> branch = [
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
  ];
  List<String> debit = [
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
    '500.00',
  ];
  List<String> credit = [
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABC /29.09.2023',
                style: billTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Journal',
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
                        controller: dateInput,
                        title: 'Accounting Date',
                        onTap: () async {
                          dateSelection(controller: dateInput);
                        },
                      ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: referenceController, title: 'Reference')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(child: Container())
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              EditableTable(
                  tableDataWidgets: List.generate(account.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(30),
                        width: AppScreenUtil().screenWidth(600),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                inventorySelectionColor.withOpacity(0.7)),
                            color: Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),

                          ///scrolling row
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        account[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        partner[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(employee[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(branch[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(debit[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(credit[index],
                                        style: cartItemTitleStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        // bottomBar(context);
                      },
                    );
                  }),
                  tableRowWidth: 600,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Partner',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Employee',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Branch',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Debit',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Credit',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
            ]));
  }
}
