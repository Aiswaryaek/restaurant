import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class PaymentsListScreen extends StatefulWidget {
  const PaymentsListScreen({super.key});

  @override
  State<PaymentsListScreen> createState() => _PaymentsListScreenState();
}

class _PaymentsListScreenState extends State<PaymentsListScreen> {
  ScrollController paymentsTableScrollController = ScrollController();
  double paymentsTableIndicatorPosition = 0.0;
  @override
  void initState() {
    super.initState();
    paymentsTableScrollController.addListener(() {
      setState(() {
        paymentsTableIndicatorPosition =
            (paymentsTableScrollController.offset /
                    paymentsTableScrollController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    paymentsTableScrollController.dispose();

    super.dispose();
  }

  List<String> dateList = [
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023'
  ];
  List<String> paymentTypeList = ['Lorem', 'Lorem', 'Lorem', 'Lorem'];
  List<String> nameList = [
    'PAYMENT/2023/10/0001',
    'PAYMENT/2023/10/0001',
    'PAYMENT/2023/10/0001',
    'PAYMENT/2023/10/0001'
  ];
  List<String> customerList = ['Munshid', 'Munshid', 'Munshid', 'Munshid'];

  List<String> totalAmountList = ['10000', '10000', '10000', '10000'];
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
                    scrollController: paymentsTableScrollController,
                    slidingIndicatorPosition: paymentsTableIndicatorPosition,
                    tableDataWidgets: List.generate(dateList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(800),
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
                                        width: AppScreenUtil().screenWidth(80),
                                        color: Colors.transparent,
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
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(135),
                                        child: Center(
                                          child: Text(nameList[index],
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
                                        width: AppScreenUtil().screenWidth(80),
                                        child: Center(
                                          child: Text(paymentTypeList[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Uom data
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(customerList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(105),
                                        child: Center(
                                          child:  Text(totalAmountList[index],
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
                                          child: Text(createdByList[index],
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
                    tableRowWidth: 800,
                    titleWidgets: [
                      ///Date heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(80),
                            child: Center(
                              child:  Text(
                                'Date',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Name heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(135),
                            child: Center(
                              child:  Text(
                                'Name',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///From heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(80),
                            child: Center(
                              child:  Text(
                                'Payment Type',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      /// To heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(80),
                            child: Center(
                              child: Text(
                                'Customer',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Contact heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(105),
                            child: Center(
                              child: Text(
                                'Total Amount',
                                style: tableTitleLabelStyle,
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
                            width: AppScreenUtil().screenWidth(60),
                            child: Center(
                              child:  Text(
                                'Created By',
                                style: tableTitleLabelStyle,
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
                            width: AppScreenUtil().screenWidth(80),
                            child: Center(
                              child:  Text(
                                'Status',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]))
          ],
        ),
      ],
    );
  }
}
