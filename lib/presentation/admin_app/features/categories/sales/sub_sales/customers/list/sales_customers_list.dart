import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class SalesCustomersList extends StatefulWidget {
  const SalesCustomersList({super.key});

  @override
  State<SalesCustomersList> createState() => _SalesCustomersListState();
}

class _SalesCustomersListState extends State<SalesCustomersList> {
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
    'Name of Customer',
    'Name of Customer',
    'Name of Customer',
    'Name of Customer'
  ];
  List<String> phoneList = [
    '9778675467',
    '9778675467',
    '9778675467',
    '9778675467'
  ];
  List<String> emailList = [
    'Leeyet@gmail.com',
    'Leeyet@gmail.com',
    'Leeyet@gmail.com',
    'Leeyet@gmail.com'
  ];

  List<String> countryList = ['UAE', 'UAE', 'UAE', 'UAE'];
  List<String> createdByList = ['Leeyet', 'Leeyet', 'Leeyet', 'Leeyet'];
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
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: () {
                            inventoryProductBottomSheet(context);
                          },
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(670),
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
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child: Text(
                                            dateList[index],
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
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child:  Text(nameList[index],
                                              style: tableSubTitleLabelStyle,
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
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(phoneList[index],
                                              style: tableSubTitleLabelStyle,
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
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:   Text(emailList[index],
                                              style: tableSubTitleLabelStyle,
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
                                          child:  Text(countryList[index],
                                              style: tableSubTitleLabelStyle,
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
                                          child: Text(createdByList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
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
                    tableRowWidth: 670,
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
                            width: AppScreenUtil().screenWidth(100),
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
                            width: AppScreenUtil().screenWidth(95),
                            child: Center(
                              child:   Text(
                                'Phone',
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
                              child:   Text(
                                'Email',
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
                              child:  Text(
                                'Country',
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
                                'Created By',
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
