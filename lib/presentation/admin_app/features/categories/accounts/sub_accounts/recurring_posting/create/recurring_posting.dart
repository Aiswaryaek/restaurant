// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/editableTable.dart';

class RecurringPosting extends StatefulWidget {
  const RecurringPosting({super.key});


  @override
  State<RecurringPosting> createState() => _RecurringPostingState();
}

class _RecurringPostingState extends State<RecurringPosting> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final instanceController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final frequencyController = TextEditingController();
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
  final option = <ProductCategoriesModel>[];
  int? tappedType = 0;
  dynamic currentTab = 'Invoice Lines';
  List<String> products = [
    'Orange',
  ];
  List<String> label = [
    'Lorem',
  ];
  List<String> accounts = [
    'Current Asset',
  ];
  List<String> uom = [
    'KG',
  ];
  List<String> qty = [
    '50',
  ];
  List<String> unitPrice = [
    '500',
  ];
  List<String> discount = [
    '10%',
  ];
  List<String> tax1 = [
    '4%',
  ];
  List<String> tax2 = [
    '5%',
  ];
  List<String> amount = [
    '1000',
  ];

  List<String> accountCode = [
    'Current Asset',
    'Current Asset',
    'Current Asset',
  ];

  List<String> account = [
    'Company',
    'Company',
    'Company',
  ];

  List<String> debit = [
    'Munshid',
    'Munshid',
    'Munshid',
  ];

  List<String> credit = [
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
  ];

  List<String> debitBalance = [
    '500',
    '500',
    '500',
  ];
  List<String> creditBalance = [
    '1000',
    '1000',
    '1000',
  ];
  String? tableSelected;
  final List<String> tableDropDown = ['Asset', ' Assets'];
  dynamic tappedProducts = false;
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  String? selected;

  @override
  void initState() {
    dateinput.text = "";
    option.add(ProductCategoriesModel('Invoice Lines',''));
    option.add(ProductCategoriesModel('Other Info',''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            child:
                            CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Vouch No',
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue;
                                });
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: instanceController,
                                title: 'Instance')
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: descriptionController,
                                title: 'Description')
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: dateController,
                                title: 'Date')
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                            CustomTextFieldWithDate(
                              controller: dateinput,
                              title: 'Ref No',
                              onTap: () async {
                                dateSelection(controller: dateinput);
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: frequencyController,
                                title: 'Frequency')
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                            CustomTextFieldWithDate(
                              controller: dateinput,
                              title: 'Next Execution',
                              onTap: () async {
                                dateSelection(controller: dateinput);
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Valid Until',
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue;
                                });
                              },
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    Divider(
                      color: inventorySelectionColor,
                      thickness: 1.5,
                    ),
                  ],
                )),
            Padding(padding: EdgeInsets.only(left: 16,bottom: 40),child:  EditableTable(
                tableDataWidgets:
                List.generate(account.length, (index) {
                  return InkWell(
                    child: Container(
                      height: AppScreenUtil().screenHeight(37),
                      width: AppScreenUtil().screenWidth(700),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: inventorySelectionColor),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(18)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child:  Text(
                                        accountCode[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child:  Text(
                                        account[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(
                                        debit[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(
                                        credit[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(
                                        debitBalance[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child:  Text(
                                        creditBalance[index],
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 700,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Center(
                          child: Text(
                            'G/L Account Code',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Center(
                          child:  Text(
                            'G/L Account',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(100),
                        child: Center(
                          child:  Text(
                            'Debit',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child: Text(
                            'Credit',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child:  Text(
                            'Debit Balance',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child:  Text(
                            'Credit Balance',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ]),)
          ],
        ),
        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
