// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';

class CashOrCardSummary extends StatefulWidget {
  const CashOrCardSummary({super.key});

  @override
  State<CashOrCardSummary> createState() => _CashOrCardSummaryState();
}

class _CashOrCardSummaryState extends State<CashOrCardSummary> {
  final fromDateInputController = TextEditingController();
  final toDateInputController = TextEditingController();
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

  List<String> paymentMethod = [
    'Card',
    'Card',
    'Card',
    'Card',
  ];
  List<String> amount = [
    '1234.00',
    '1234.00',
    '1234.00',
    '1234.00',
  ];
  List<String> commission = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  List<String> balance = [
    '1030.00',
    '1030.00',
    '1030.00',
    '1030.00',
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        title: 'Shift',
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
                height: AppScreenUtil().screenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithDate(
                        controller: toDateInputController,
                        title: 'From Date',
                        onTap: () async {
                          dateSelection(controller: toDateInputController);
                        },
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithDate(
                        controller: toDateInputController,
                        title: 'To Date',
                        onTap: () async {
                          dateSelection(controller: toDateInputController);
                        },
                      )),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Align(
                alignment: Alignment.centerRight,
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
                          style: inventoryCreateButtonLabelStyle,
                          textAlign: TextAlign.center),
                    )),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Container(
                height: AppScreenUtil().screenHeight(30),
                width: AppScreenUtil().screenWidth(418),
                decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    )),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(18)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Product Details',
                        style: specialItemsTagPriceTextStyle,
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.fromLTRB(16, 7, 0, 7),child: Text('Cash & Bank',style: salesDetailsSubLabelStyle,),),
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Table heading
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(418),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Payment Method',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                      maxLines: 1,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Amount',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Commission',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Balance',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: List.generate(paymentMethod.length, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(418),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.7,
                                  color: posPaymentBorderColor
                                      .withOpacity(0.5)),
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil()
                                      .screenWidth(18)),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(paymentMethod[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              amount[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              commission[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              balance[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                          },
                        );
                      }),
                    ),
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(418),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('Total',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2345.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2010.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: AppScreenUtil().screenHeight(7),),
              Padding(padding: EdgeInsets.fromLTRB(16, 0, 0, 7),child: Text('Cheque',style: salesDetailsSubLabelStyle,),),
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Table heading
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(418),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Payment Method',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                      maxLines: 1,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Amount',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Commission',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Balance',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: List.generate(2, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(418),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.7,
                                  color: posPaymentBorderColor
                                      .withOpacity(0.5)),
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil()
                                      .screenWidth(18)),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text('Cheque',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              '400.00',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              commission[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              balance[index],
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                          },
                        );
                      }),
                    ),
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(418),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('Total',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2345.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2010.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: AppScreenUtil().screenHeight(7),),
              Padding(padding: EdgeInsets.fromLTRB(16, 0, 0, 7),child: Text('Return',style: salesDetailsSubLabelStyle,),),
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Table heading
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(520),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Payment Method',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                      maxLines: 1,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Amount',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: List.generate(2, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(520),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.7,
                                  color: posPaymentBorderColor
                                      .withOpacity(0.5)),
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil()
                                      .screenWidth(18)),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text('Cash',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              '400.00',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                          },
                        );
                      }),
                    ),
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(520),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('Total',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2010.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: AppScreenUtil().screenHeight(7),),
              Padding(padding: EdgeInsets.fromLTRB(16, 0, 0, 7),child: Text('Expense',style: salesDetailsSubLabelStyle,),),
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Table heading
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(520),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Payment Method',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                      maxLines: 1,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Type',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Expense Type',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Note',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
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
                                  width: AppScreenUtil()
                                      .screenWidth(95),
                                  child: Center(
                                    child: Text(
                                      'Amount',
                                      style:
                                      tableTitleLabelStyleForEmployeeDashBoard,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Column(
                      children: List.generate(5, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(520),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.7,
                                  color: posPaymentBorderColor
                                      .withOpacity(0.5)),
                              color: whiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil()
                                      .screenWidth(18)),
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
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text('Petty Cash',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              'Outlet Expense',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              'Printing and Stationary Exp',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              '',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        color: Colors.transparent,
                                        width: AppScreenUtil()
                                            .screenWidth(95),
                                        child: Center(
                                          child: Text(
                                              '1030.00',
                                              style:
                                              tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow
                                                  .ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                          },
                        );
                      }),
                    ),
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(520),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('Total',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('',style:
                                      tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('2010.00',
                                          style:
                                          tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(10),),
                    Container(
                      height: AppScreenUtil().screenHeight(30),
                      width: AppScreenUtil().screenWidth(520),
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          )),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('Session Total',style:
                                      floorSubmitButtonTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',style:
                                      floorSubmitButtonTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',style:
                                      floorSubmitButtonTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
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
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',style:
                                      floorSubmitButtonTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    color: Colors.transparent,
                                    width: AppScreenUtil()
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('0.00',
                                          style:
                                          floorSubmitButtonTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow
                                              .ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: AppScreenUtil().screenHeight(15),),
            ],
          ),
        ),
      ],
    );
  }

///a
}
