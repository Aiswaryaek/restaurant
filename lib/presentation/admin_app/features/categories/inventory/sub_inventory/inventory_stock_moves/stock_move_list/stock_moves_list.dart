// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/inventory_stock_moves/stock_move_detail/stock_moves_detail.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../stock_moves_controller.dart';

class InventoryStockMovesList extends StatefulWidget {
  const InventoryStockMovesList({super.key});

  @override
  State<InventoryStockMovesList> createState() =>
      _InventoryStockMovesListState();
}

class _InventoryStockMovesListState extends State<InventoryStockMovesList> {
  ScrollController inventoryStockMovesTableScrollController =
      ScrollController();
  double inventoryStockMovesTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    inventoryStockMovesTableScrollController.addListener(() {
      setState(() {
        inventoryStockMovesTableIndicatorPosition =
            (inventoryStockMovesTableScrollController.offset /
                    inventoryStockMovesTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    inventoryStockMovesTableScrollController.dispose();

    super.dispose();
  }

  List<String> item = [
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts',
    'Shirts'
  ];
  List<String> uom = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit'
  ];
  List<String> opening = [
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00',
    '50.00'
  ];
  List<String> listIn = [
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00',
    '220.00'
  ];
  List<String> listOut = [
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00',
    '100.00'
  ];
  List<String> closing = [
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00',
    '170.00'
  ];
  List<String> avg = [
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
    '500.00'
  ];
  List<String> value = [
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00',
    '5000.00'
  ];
  final StockMovesController stockMovesCtrl = Get.put(StockMovesController());
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<String> statusList = ['Available', 'Cancel'];

  List<Color> alternateStatusColor = [
    bankReceiptButtonColorGreen,
    bankReceiptButtonColorRed
  ];
  bool tappedList = false;
  dynamic tappedItem = 'Stock Move Report';

  @override
  Widget build(BuildContext context) {
    return stockMovesCtrl.stockMovesDetailTapped.value != 'Test'
        ? InventoryStockMovesDetail(stockMovesCtrl.stockMovesDetailTapped.value)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  tappedItem,
                  style: tableTitleLabelStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, bottom: 40),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ///Table heading
                              Container(
                                height: AppScreenUtil().screenHeight(25),
                                width: AppScreenUtil().screenWidth(850),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          AppScreenUtil().screenWidth(6)),
                                      topRight: Radius.circular(
                                          AppScreenUtil().screenWidth(6))),
                                  color: blackColor,
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
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                'Item',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                'UOM',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                'Opening',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                'In',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                'Out',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                'Closing',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                'Avg',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                'Value',
                                                style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                                  children: List.generate(item.length, (index) {
                                return InkWell(
                                  child: Container(
                                    height: AppScreenUtil().screenHeight(30),
                                    width: AppScreenUtil().screenWidth(850),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: whiteColor.withOpacity(0.7),
                                          width: 0.8),
                                      color: salesReportTableColor,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child: Text(
                                                    item[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
                                                    uom[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
                                                    opening[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child: Text(
                                                    listIn[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child: Text(
                                                    listOut[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
                                                    closing[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
                                                    avg[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                    .screenWidth(90),
                                                child: Center(
                                                  child:  Text(
                                                    value[index],
                                                    style:
                                                    salesReportSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      tappedList = true;
                                      stockMovesCtrl.stockMovesDetailTapped
                                          .value = item[index];
                                      print(
                                          'TappedItem ${stockMovesCtrl.stockMovesDetailTapped.value}');
                                    });
                                  },
                                );
                              })),
                              Container(
                                height: AppScreenUtil().screenHeight(25),
                                width: AppScreenUtil().screenWidth(850),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          AppScreenUtil().screenWidth(6)),
                                      bottomRight: Radius.circular(
                                          AppScreenUtil().screenWidth(6))),
                                  color: blackColor,
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
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                'Total',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(80),
                                            child: Center(
                                              child:  Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child:  Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width: AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                '',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
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
                                            width:
                                            AppScreenUtil().screenWidth(90),
                                            child: Center(
                                              child: Text(
                                                '18000.00',
                                                style:
                                                accountPayableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
