import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';

class QuotationList extends StatefulWidget {
  const QuotationList({super.key});

  @override
  State<QuotationList> createState() => _QuotationListState();
}

class _QuotationListState extends State<QuotationList> {
  ScrollController quotationTableScrollController = ScrollController();
  double quotationTableIndicatorPosition = 0.0;
  List<Color> buttonColor = [
    draftButtonColor.withOpacity(0.5),
    postedButtonColor,
    buttonAvailableColor.withOpacity(0.5)
  ];

  @override
  void initState() {
    super.initState();
    quotationTableScrollController.addListener(() {
      setState(() {
        quotationTableIndicatorPosition =
            (quotationTableScrollController.offset /
                    quotationTableScrollController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    quotationTableScrollController.dispose();

    super.dispose();
  }

  List<String> dateList = [
    '28/02/2023',
    '30/02/2023',
    '13/05/2023',
    '15/03/2023'
  ];
  List<String> nameList = [
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001'
  ];
  List<String> customerList = [
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer'
  ];
  List<String> totalList = ['1000.00', '1000.00', '1000.00', '1000.00'];
  List<String> createdByList = ['Leeyet', 'Leeyet', 'Leeyet', 'Leeyet'];

  List<String> statusList = ['Draft', 'Posted', 'Cancel'];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
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
                    scrollController: quotationTableScrollController,
                    slidingIndicatorPosition: quotationTableIndicatorPosition,
                    tableDataWidgets: List.generate(dateList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(0)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(650),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child: Text(
                                            nameList[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product name data
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(80),
                                        child: Center(
                                          child: Text(dateList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Product image data
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(customerList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Uom data
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(totalList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
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
                                          child: Text(createdByList[index],
                                              style: tableSubTitleLabelStyle,
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
                                              buttonColor: buttonColor[
                                                  index % buttonColor.length],
                                              borderRadius: 6,
                                              buttonText: statusList[
                                                  index % statusList.length],
                                              buttonLabelStyle:
                                                  adminDashBoardViewMoreButtonLabelStyle)
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    tableRowWidth: 650,
                    titleWidgets: [
                      ///Date heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(100),
                            child: Center(
                              child: Text(
                                'Name',
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

                      ///From heading

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(95),
                            child: Center(
                              child:  Text(
                                'Customer',
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
                            width: AppScreenUtil().screenWidth(95),
                            child: Center(
                              child:  Text(
                                'Total',
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
                            width: AppScreenUtil().screenWidth(80),
                            child: Center(
                              child: Text(
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
                              child: Text(
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
