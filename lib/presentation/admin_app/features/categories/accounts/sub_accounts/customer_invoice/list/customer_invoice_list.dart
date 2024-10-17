import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class CustomerInvoiceList extends StatefulWidget {
  const CustomerInvoiceList({super.key});

  @override
  State<CustomerInvoiceList> createState() => _CustomerInvoiceListState();
}

class _CustomerInvoiceListState extends State<CustomerInvoiceList> {
  ScrollController customerInvoiceTableScrollController = ScrollController();
  double customerInvoiceTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    customerInvoiceTableScrollController.addListener(() {
      setState(() {
        customerInvoiceTableIndicatorPosition =
            (customerInvoiceTableScrollController.offset /
                    customerInvoiceTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    customerInvoiceTableScrollController.dispose();

    super.dispose();
  }

  List<String> dateList = [
    '28/02/2023',
    '30/02/2023',
    '13/05/2023',
    '15/03/2023'
  ];
  List<String> customerList = ['Anshad', 'Anshad', 'Anshad', 'Anshad'];
  List<String> nameList = [
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001'
  ];
  List<String> invoiceDateList = [
    '28/02/2023',
    '30/02/2023',
    '13/05/2023',
    '15/03/2023'
  ];
  List<String> invoiceReferenceList = ['Lorem', 'Lorem', 'Lorem', 'Lorem'];
  List<String> totalList = ['10000', '10000', '10000', '10000'];
  List<String> createdByList = ['Munshid', 'Munshid', 'Munshid', 'Munshid'];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> statusList = ['Draft', 'Posted', 'Cancel'];
  List<Color> alternateStatusColor = [
    customerInvoiceDraftButtonColor.withOpacity(0.5),
    customerInvoicePostedButtonColor.withOpacity(0.9),
    customerInvoiceCancelButtonColor.withOpacity(0.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: AppScreenUtil().screenHeight(15),
                    left: AppScreenUtil().screenWidth(16)),
                child: InventoryTableLayout(
                    scrollController: customerInvoiceTableScrollController,
                    slidingIndicatorPosition:
                        customerInvoiceTableIndicatorPosition,
                    tableDataWidgets: List.generate(dateList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(835),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Product id data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(80),
                                        child: Center(
                                          child: Text(
                                            dateList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product name data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(105),
                                        child: Center(
                                          child:   Text(nameList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product image data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(65),
                                        child: Center(
                                          child:  Text(customerList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Uom data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(80),
                                        child: Center(

                                          child: Text(invoiceDateList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
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
                                        width: AppScreenUtil().screenWidth(105),
                                        child: Center(
                                          child:  Text(invoiceReferenceList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
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
                                        width: AppScreenUtil().screenWidth(60),
                                        child: Center(
                                          child:  Text(totalList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
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
                                        width: AppScreenUtil().screenWidth(80),
                                        child: Center(
                                          child:  Text(createdByList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(80),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                              buttonHeight: AppScreenUtil()
                                                  .screenHeight(18),
                                              buttonWidth: AppScreenUtil()
                                                  .screenWidth(60),
                                              buttonColor: alternateStatusColor[
                                                  index %
                                                      alternateStatusColor
                                                          .length],
                                              borderRadius: 6,
                                              buttonText: statusList[
                                                  index % statusList.length],
                                              buttonLabelStyle:
                                                  adminDashBoardViewMoreButtonLabelStyle),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    tableRowWidth: 835,
                    titleWidgets: [
                      ///Date heading
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                      ///Name heading

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(105),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                      ///From heading

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Customer',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                      /// To heading

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Invoice Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                      ///Contact heading

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(105),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Invoice Reference',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total',
                              style: tableTitleLabelStyle,
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
                              'Created By',
                              style: tableTitleLabelStyle,
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
                              'Status',
                              style: tableTitleLabelStyle,
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
