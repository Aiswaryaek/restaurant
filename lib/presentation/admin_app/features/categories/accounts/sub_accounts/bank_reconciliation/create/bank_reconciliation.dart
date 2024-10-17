// ignore_for_file: prefer_const_constructors

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
import '../../../../../../widgets/outlined_table.dart';

class BankReconciliation extends StatefulWidget {
  const BankReconciliation({super.key});

  @override
  State<BankReconciliation> createState() => _BankReconciliationState();
}

class _BankReconciliationState extends State<BankReconciliation> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final journalController = TextEditingController();
  final closingBalanceController = TextEditingController();
  final bankBalanceController = TextEditingController();
  ScrollController bankReconciliationController = ScrollController();
  final dateinput = TextEditingController();

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

  List<String> date = [
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
    '23/12/2024',
  ];
  List<String> transactionType = [
    'Payment',
    'Payment',
    'Payment',
    'Payment',
    'Payment',
    'Payment',
  ];
  List<String> name = [
    'JRN/1567',
    'JRN/1567',
    'JRN/1567',
    'JRN/1567',
    'JRN/1567',
    'JRN/1567',
  ];
  List<String> approvalNo = [
    '1234',
    '1234',
    '1234',
    '1234',
    '1234',
    '1234',
  ];
  List<String> amount = [
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
  ];
  List<String> charge = [
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
  ];
  List<String> bankDate = [
    '15/12/2024',
    '15/12/2024',
    '15/12/2024',
    '15/12/2024',
    '15/12/2024',
    '15/12/2024',
  ];
  List<String> bankCharge = [
    '45',
    '45',
    '45',
    '45',
    '45',
    '45',
  ];
  List<String> bankBalance = [
    '505',
    '505',
    '505',
    '505',
    '505',
    '505',
  ];
  List<String> status = [
    'Reconcilated',
    'Reconcilated',
    'Reconcilated',
    'Reconcilated',
    'Reconcilated',
    'Reconcilated',
  ];

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Reference',
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue;
                                });
                              },
                            )),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child: CustomTextFieldWithTitle(
                                controller: journalController,
                                title: 'Journal'))
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CustomTextFieldWithDate(
                              controller: dateinput,
                              title: 'Date',
                              onTap: () async {
                                dateSelection(controller: dateinput);
                              },
                            )),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child: CustomTextFieldWithTitle(
                                controller: closingBalanceController,
                                title: 'Closing Balance'))
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CustomTextFieldWithTitle(
                                controller: bankBalanceController,
                                title: 'Bank Balance')),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(child: Container())
                      ],
                    ),
                  ],
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(
            color: blackColor,
            thickness: 0.8,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: EditableTable(
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(30),
                    width: AppScreenUtil().screenWidth(930),
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
                                    date[index],
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
                                    transactionType[index],
                                    style: cartItemTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(name[index],
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
                                Text(approvalNo[index],
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
                                Text(amount[index],
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
                                Text(charge[index],
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
                                Text(bankDate[index],
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
                                Text(bankCharge[index],
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
                                Text(bankBalance[index],
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 2),
                                      width:
                                      AppScreenUtil().screenWidth(65),
                                      height: AppScreenUtil()
                                          .screenHeight(18),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        color: reConciliatedButtonColor
                                            .withOpacity(0.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          status[index],
                                          style:
                                          inventoryCreateButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    // bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 930,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
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
                          'Transaction Type',
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
                          'Name',
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
                          'Approval No',
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
                          'Amount',
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
                          'Charge',
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
                          'Bank Date',
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
                          'Bank Charge',
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
                          'Bank Balance',
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
                          'Status',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(
            color: blackColor,
            thickness: 0.8,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Transaction not reflected in bank',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: EditableTable(
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(30),
                    width: AppScreenUtil().screenWidth(930),
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
                                    date[index],
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
                                    transactionType[index],
                                    style: cartItemTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(name[index],
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
                                Text(approvalNo[index],
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
                                Text(amount[index],
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
                                Text(charge[index],
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
                                Text('',
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
                                Text('',
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
                                Text('',
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 2),
                                      width:
                                      AppScreenUtil().screenWidth(65),
                                      height: AppScreenUtil()
                                          .screenHeight(18),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        color: rePendingButtonColor
                                            .withOpacity(0.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Pending',
                                          style:
                                          inventoryCreateButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    // bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 930,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
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
                          'Transaction Type',
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
                          'Name',
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
                          'Approval No',
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
                          'Amount',
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
                          'Charge',
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
                          'Bank Date',
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
                          'Bank Charge',
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
                          'Bank Balance',
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
                          'Status',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(
            color: blackColor,
            thickness: 0.8,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Transaction not reflected in company book',
            style: tableTitleLabelStyle,
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: EditableTable(
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(30),
                    width: AppScreenUtil().screenWidth(970),
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
                                    '',
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
                                    '',
                                    style: cartItemTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(85),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('',
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
                                Text('',
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
                                Text('',
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
                                Text('',
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
                                Text(bankDate[index],
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
                                Text(bankCharge[index],
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
                                Text(bankBalance[index],
                                    style: cartItemTitleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(137),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(bottom: 2),
                                      width:
                                      AppScreenUtil().screenWidth(65),
                                      height: AppScreenUtil()
                                          .screenHeight(18),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        color: rePendingButtonColor
                                            .withOpacity(0.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Pending',
                                          style:
                                          inventoryCreateButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 2),
                                      width:
                                      AppScreenUtil().screenWidth(65),
                                      height: AppScreenUtil()
                                          .screenHeight(18),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        color: postTransactionButtonColor
                                            .withOpacity(0.4),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Post',
                                          style:
                                          inventoryCreateButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    // bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 970,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
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
                          'Transaction Type',
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
                          'Name',
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
                          'Approval No',
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
                          'Amount',
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
                          'Charge',
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
                          'Bank Date',
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
                          'Bank Charge',
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
                          'Bank Balance',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(145),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Status',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16,bottom: 3),
          child: Divider(
            color: blackColor,
            thickness: 0.8,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(16,5,16,20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 9),
                color: inventorySelectionColor.withOpacity(0.65),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('System closing balance',style: cartItemTitleStyle,),
                    Text('AED 3500.00',style:cartItemTitleStyle ,)
                  ],
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(3),),
              Container(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 9),
                color: inventorySelectionColor.withOpacity(0.65),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('System closing balance',style: cartItemTitleStyle,),
                    Text('AED 100.00',style:cartItemTitleStyle ,)
                  ],
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(3),),
              Container(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 9),
                color: inventorySelectionColor.withOpacity(0.65),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('System closing balance',style: cartItemTitleStyle,),
                    Text('AED 150.00',style:cartItemTitleStyle ,)
                  ],
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(3),),
              Container(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 9),
                color: inventorySelectionColor.withOpacity(0.65),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('System closing balance',style: cartItemTitleStyle,),
                    Text('AED 350.00',style:cartItemTitleStyle ,)
                  ],
                ),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              Container(
                padding: EdgeInsets.fromLTRB(8, 5, 8, 9),
                decoration: BoxDecoration(
                    color: inventorySelectionColor.withOpacity(0.65),border: Border.all(color: confirmColor,width: 1.5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('System closing balance',style: cartItemTitleStyle,),
                    Text('AED 3250.00',style:cartItemTitleStyle ,)
                  ],
                ),
              ),
            ],
          ),)
      ],
    );
  }
}
