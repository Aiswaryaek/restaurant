// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sub_sales/sales_report/detail/detail.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_table_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class SalesReportList extends StatefulWidget {
  const SalesReportList({super.key});

  @override
  State<SalesReportList> createState() => _SalesReportListState();
}

class _SalesReportListState extends State<SalesReportList> {
  ScrollController salesReportTableScrollController = ScrollController();
  double salesReportTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    salesReportTableScrollController.addListener(() {
      setState(() {
        salesReportTableIndicatorPosition =
            (salesReportTableScrollController.offset /
                    salesReportTableScrollController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    salesReportTableScrollController.dispose();

    super.dispose();
  }

  List<String> itemList = [
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item',
    'Name of item'
  ];
  List<String> uomList = [
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
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit'
  ];
  List<String> openingQtyList = [
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10'
  ];
  List<String> soldQtyList = [
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15',
    '15'
  ];
  List<String> returnQtyList = [
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20',
    '20'
  ];
  List<String> closingItemList = [
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25',
    '25'
  ];
  List<String> grossItemSalesList = [
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30',
    '30'
  ];
  List<String> totalItemCostList = [
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500',
    '500'
  ];
  List<String> itemProfitList = [
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000',
    '1000'
  ];
  List<String> grossProfitPerUnitList = [
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10',
    '10'
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tappedList == true
            ? SalesReportDetail()
            : Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenHeight(15),
                          left: AppScreenUtil().screenWidth(16)),
                      child: CustomTableLayout(
                          tableTitleColor: blackColor,
                          scrollController: salesReportTableScrollController,
                          slidingIndicatorPosition:
                              salesReportTableIndicatorPosition,
                          tableDataWidgets:
                              List.generate(itemList.length, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenWidth(2)),
                              child: GestureDetector(
                                onTap: () {
                                  ///Table row ontap
                                  setState(() {
                                    tappedList = true;
                                  });
                                },
                                child: Container(
                                  height: AppScreenUtil().screenHeight(23),
                                  width: AppScreenUtil().screenWidth(1000),
                                  decoration: const BoxDecoration(
                                    color: salesReportTableColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(18)),

                                    ///scrolling row
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
                                              AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child: Text(
                                                  itemList[index],
                                                  style: tableSubTitleLabelStyle,
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
                                                child: Text(uomList[index],
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
                                              AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child:  Text(openingQtyList[index],
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
                                              AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child: Text(soldQtyList[index],
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
                                              AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child:  Text(returnQtyList[index],
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
                                              AppScreenUtil().screenWidth(80),
                                              child: Center(
                                                child:   Text(closingItemList[index],
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
                                                child:  Text(grossItemSalesList[index],
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
                                                child:  Text(totalItemCostList[index],
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
                                                child:   Text(itemProfitList[index],
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
                                              AppScreenUtil().screenWidth(120),
                                              child: Center(
                                                child:  Text(
                                                    grossProfitPerUnitList[index],
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
                              ),
                            );
                          }),
                          tableRowWidth: 1000,
                          titleWidgets: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'UOM',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Opening Qty',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sold Qty',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Return Qty',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Closing Item',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Gross Item Sales',
                                    style: tableTitleLabelStyleForSalesReport,
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
                                    'Total Item Cost',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Profit',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(120),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Gross Profit Per Unit',
                                    style: tableTitleLabelStyleForSalesReport,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ]))
                ],
              ),
      ],
    );
  }
}
