import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class AccountPurchaseList extends StatefulWidget {
  const AccountPurchaseList({super.key});

  @override
  State<AccountPurchaseList> createState() => _AccountPurchaseListState();
}

class _AccountPurchaseListState extends State<AccountPurchaseList> {
  ScrollController accountPurchaseTableScrollController = ScrollController();
  double accountPurchaseTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    accountPurchaseTableScrollController.addListener(() {
      setState(() {
        accountPurchaseTableIndicatorPosition =
            (accountPurchaseTableScrollController.offset /
                    accountPurchaseTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    accountPurchaseTableScrollController.dispose();

    super.dispose();
  }

  List<String> dateList = ['ABC12345', 'ABC12345', 'ABC12345', 'ABC12345'];
  List<String> vendorList = ['OOPACKS', 'OOPACKS', 'OOPACKS', 'OOPACKS'];
  List<String> nameList = [
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001'
  ];
  List<String> billDate = [
    '28/02/2023',
    '30/02/2023',
    '13/05/2023',
    '15/03/2023'
  ];
  List<String> billReferenceList = ['Lorem', 'Lorem', 'Lorem', 'Lorem'];
  List<String> totalList = ['10000', '10000', '10000', '10000'];
  List<String> createdByList = ['Munshid', 'Munshid', 'Munshid', 'Munshid'];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<String> statusList = ['Draft', 'Posted', 'Cancel'];
  List<Color> alternateStatusColor = [
    customerInvoiceDraftButtonColor.withOpacity(0.5),
    customerInvoicePostedButtonColor.withOpacity(0.5),
    customerInvoiceCancelButtonColor.withOpacity(0.5),
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
                    scrollController: accountPurchaseTableScrollController,
                    slidingIndicatorPosition:
                        accountPurchaseTableIndicatorPosition,
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
                                        child: Center(child: Text(
                                          dateList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),),
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
                                        child: Center(child: Text(nameList[index],
                                            style: dashBoardTextStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),),
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
                                            child: Text(vendorList[index],
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
                                          child: Text(billDate[index],
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
                                        width: AppScreenUtil().screenWidth(85),
                                        child: Center(
                                          child: Text(billReferenceList[index],
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
                                          child:   Text(createdByList[index],
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
                              'Vendor',
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
                              'Bill Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                      ///Contact heading

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bill Reference',
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
