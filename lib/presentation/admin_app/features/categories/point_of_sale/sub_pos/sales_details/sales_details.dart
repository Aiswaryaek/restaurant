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

class SalesDetailReport extends StatefulWidget {
  const SalesDetailReport({super.key});

  @override
  State<SalesDetailReport> createState() => _SalesDetailReportState();
}

class _SalesDetailReportState extends State<SalesDetailReport> {
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

  List<String> comboProduct = [
    'Biriyani Combo',
    'Biriyani Combo',
  ];
  List<String> comboQty = [
    '4',
    '4',
  ];
  List<String> comboAmount = [
    '100.00',
    '100.00',
  ];
  List<String> paymentMethod = [
    'Bank',
    'Wallet',
    'Master Card',
    'Cash',
    'Visa',
    'Cheque',
  ];
  List<String> paymentAmount = [
    '100345.00',
    '100.00',
    '100345.00',
    '100.00',
    '100345.00',
    '100.00',
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
                      child: Transform.translate(
                    offset: Offset(0, 10),
                    child: Padding(
                      padding: EdgeInsets.only(left: 70),
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
                  ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Container(
                height: AppScreenUtil().screenHeight(30),
                width: AppScreenUtil().screenWidth(320),
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
              Padding(padding: EdgeInsets.fromLTRB(10, 7, 0, 7),child: Text('Combo',style: salesDetailsSubLabelStyle,),),
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
                        width: AppScreenUtil().screenWidth(320),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: adminDashBoardTableAlternateColor
                              .withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              AppScreenUtil().screenWidth(5)),
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
                                        'Product',
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
                                        'Qty',
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
                        children: List.generate(comboProduct.length, (index) {
                          return InkWell(
                            child: Container(
                              height:
                              AppScreenUtil().screenHeight(33),
                              width:
                              AppScreenUtil().screenWidth(320),
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
                                        .screenWidth(5)),
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
                                            child: Text(comboProduct[index],
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
                                                comboQty[index],
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
                                                comboAmount[index],
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
                        width: AppScreenUtil().screenWidth(320),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color:
                          posPaymentBorderColor.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              AppScreenUtil().screenWidth(5)),
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
                                          .screenWidth(95),
                                      child: Center(
                                        child: Text('8',
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
                                        child: Text('200.00',
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
              Padding(padding: EdgeInsets.fromLTRB(10, 7, 0, 7),child: Text('Breakfast',style: salesDetailsSubLabelStyle,),),
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(5)),
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
                                      'Product',
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
                                      'Qty',
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
                      children: List.generate(comboProduct.length, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(320),
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
                                      .screenWidth(5)),
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
                                          child: Text(comboProduct[index],
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
                                              comboQty[index],
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
                                              comboAmount[index],
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(5)),
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
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('8',
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
                                      child: Text('200.00',
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
              Padding(padding: EdgeInsets.fromLTRB(10, 7, 0, 7),child: Text('General',style: salesDetailsSubLabelStyle,),),
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(5)),
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
                                      'Product',
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
                                      'Qty',
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
                      children: List.generate(comboProduct.length, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(320),
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
                                      .screenWidth(5)),
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
                                          child: Text(comboProduct[index],
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
                                              comboQty[index],
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
                                              comboAmount[index],
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(5)),
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
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('8',
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
                                      child: Text('200.00',
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
              SizedBox(height: AppScreenUtil().screenHeight(15),),
              Container(
                height: AppScreenUtil().screenHeight(30),
                width: AppScreenUtil().screenWidth(320),
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
                        'Payment Details',
                        style: specialItemsTagPriceTextStyle,
                      ),
                    )),
              ),
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: adminDashBoardTableAlternateColor
                            .withOpacity(0.05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(10)),
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
                      children: List.generate(paymentMethod.length, (index) {
                        return InkWell(
                          child: Container(
                            height:
                            AppScreenUtil().screenHeight(33),
                            width:
                            AppScreenUtil().screenWidth(320),
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
                                      .screenWidth(10)),
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
                                              paymentAmount[index],
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
                      width: AppScreenUtil().screenWidth(320),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                        posPaymentBorderColor.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppScreenUtil().screenWidth(10)),
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
                                        .screenWidth(95),
                                    child: Center(
                                      child: Text('200456.00',
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
            ],
          ),
        ),
      ],
    );
  }

  ///a
}
