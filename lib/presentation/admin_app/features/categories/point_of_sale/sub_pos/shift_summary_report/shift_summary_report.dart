// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/payment/payment.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/payment_summary/payment_summary.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/product_summary/product_summary.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/sale/sale.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/shift_report/wallet/wallet.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class ShiftSummaryReport extends StatefulWidget {
  const ShiftSummaryReport({super.key});

  @override
  State<ShiftSummaryReport> createState() => _ShiftSummaryReportState();
}

class _ShiftSummaryReportState extends State<ShiftSummaryReport> {
  final branchController = TextEditingController();
  int currentTabIndex = 0;
  final fromDateInputController = TextEditingController();
  final toDateInputController = TextEditingController();
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
  List<String> orderDate = [
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
    '2024/03/22',
  ];
  List<String> orderRef = [
    'BILL/225',
    'BILL/225',
    'BILL/225',
    'BILL/225',
  ];
  List<String> customer = [
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
    'Cash Customer',
  ];
  List<String> mobile = [
    '9065363324',
    '9065363324',
    '9065363324',
    '9065363324',
  ];
  List<String> orderAmount = [
    '133.00',
    '133.00',
    '133.00',
    '133.00',
  ];
  List<String> paidAmount = [
    '133.00',
    '133.00',
    '133.00',
    '133.00',
  ];
  List<String> credit = [
    '0.00',
    '0.00',
    '0.00',
    '0.00',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: branchController, title: 'Branch')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithDate(
                        controller: fromDateInputController,
                        title: 'From Date',
                        onTap: () async {
                          dateSelection(controller: fromDateInputController);
                        },
                      ))
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
                        title: 'To Date',
                        onTap: () async {
                          dateSelection(controller: toDateInputController);
                        },
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: Transform.translate(offset: Offset(0,10),child: Padding(padding: EdgeInsets.only(left: 70),child: Container(
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
                          )),),))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                // height: AppScreenUtil().screenHeight(99),
                width: double.infinity,
                color: shiftContainerColor,
                padding: EdgeInsets.fromLTRB(10, 10, 15, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jabel Ali',
                      style: pangramMedium(size: 14.0, color: blackColor),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(9),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shift',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'Employee',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SHIFT 21',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'Jabel Ali',
                                  style: pangramMedium(
                                      size: 9.0, color: blackColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start Date',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                Text(
                                  'End Date',
                                  style: pangramMedium(
                                      size: 9.0,
                                      color: blackColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    '2024-05-08 10:06:00',
                                    style: pangramMedium(
                                        size: 9.0, color: blackColor),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(7),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Text(
                                    '2024-05-08 10:09:07',
                                    style: pangramMedium(
                                        size: 9.0, color: blackColor),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(5),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 16),child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ///Table heading
                                Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(763),
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
                                                  'Order Date',
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
                                                  .screenWidth(130),
                                              child: Center(
                                                child: Text(
                                                  'Order Reff',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Customer',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Mobile',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Order Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Paid Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Credit',
                                                  style:
                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                  maxLines: 1,
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
                                  children: List.generate(orderDate.length, (index) {
                                    return InkWell(
                                      child: Container(
                                        height:
                                        AppScreenUtil().screenHeight(33),
                                        width:
                                        AppScreenUtil().screenWidth(763),
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
                                                      child: Text(orderDate[index],
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
                                                        .screenWidth(130),
                                                    child: Center(
                                                      child: Text(
                                                          orderRef[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          customer[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(mobile[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          orderAmount[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          paidAmount[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          credit[index],
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
                                  width: AppScreenUtil().screenWidth(763),
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
                                                  child: Text(''),
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
                                                    .screenWidth(130),
                                                child: Center(
                                                  child: Text('',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('Total',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('65.00',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('65.00',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('00.00',
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
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )),
        ),
        Padding(padding: EdgeInsets.fromLTRB(16,20,16,5),child:  Container(
          // height: AppScreenUtil().screenHeight(99),
          width: double.infinity,
          color: shiftContainerColor,
          padding: EdgeInsets.fromLTRB(10, 10, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jabel Ali',
                style: pangramMedium(size: 14.0, color: blackColor),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(9),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shift',
                            style: pangramMedium(
                                size: 9.0,
                                color: blackColor.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(7),
                          ),
                          Text(
                            'Employee',
                            style: pangramMedium(
                                size: 9.0,
                                color: blackColor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SHIFT 21',
                            style: pangramMedium(
                                size: 9.0, color: blackColor),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(7),
                          ),
                          Text(
                            'Jabel Ali',
                            style: pangramMedium(
                                size: 9.0, color: blackColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: pangramMedium(
                                size: 9.0,
                                color: blackColor.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(7),
                          ),
                          Text(
                            'End Date',
                            style: pangramMedium(
                                size: 9.0,
                                color: blackColor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(10),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppScreenUtil().screenWidth(100),
                            child: Text(
                              '2024-05-08 10:06:00',
                              style: pangramMedium(
                                  size: 9.0, color: blackColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(7),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(100),
                            child: Text(
                              '2024-05-08 10:09:07',
                              style: pangramMedium(
                                  size: 9.0, color: blackColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),),
        Padding(padding: EdgeInsets.only(left: 16,bottom: 40),child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ///Table heading
                                Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(763),
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
                                                  'Order Date',
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
                                                  .screenWidth(130),
                                              child: Center(
                                                child: Text(
                                                  'Order Reff',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Customer',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Mobile',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Order Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Paid Amount',
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
                                                  .screenWidth(100),
                                              child: Center(
                                                child: Text(
                                                  'Credit',
                                                  style:
                                                  tableTitleLabelStyleForEmployeeDashBoard,
                                                  maxLines: 1,
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
                                  children: List.generate(orderDate.length, (index) {
                                    return InkWell(
                                      child: Container(
                                        height:
                                        AppScreenUtil().screenHeight(33),
                                        width:
                                        AppScreenUtil().screenWidth(763),
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
                                                      child: Text(orderDate[index],
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
                                                        .screenWidth(130),
                                                    child: Center(
                                                      child: Text(
                                                          orderRef[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          customer[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(mobile[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          orderAmount[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          paidAmount[index],
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                          credit[index],
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
                                  width: AppScreenUtil().screenWidth(763),
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
                                                  child: Text(''),
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
                                                    .screenWidth(130),
                                                child: Center(
                                                  child: Text('',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('Total',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('65.00',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('65.00',
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
                                                    .screenWidth(100),
                                                child: Center(
                                                  child: Text('00.00',
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
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )),
        ),
      ],
    );
  }
}
