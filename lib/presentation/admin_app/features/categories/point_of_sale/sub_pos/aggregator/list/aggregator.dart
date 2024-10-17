// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class AggregatorsList extends StatefulWidget {
  const AggregatorsList({super.key});

  @override
  State<AggregatorsList> createState() => _AggregatorsListState();
}

class _AggregatorsListState extends State<AggregatorsList> {
  ScrollController aggregatorsScrollController = ScrollController();
  double aggregatorsIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    aggregatorsScrollController.addListener(() {
      setState(() {
        aggregatorsIndicatorPosition = (aggregatorsScrollController.offset /
                aggregatorsScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    aggregatorsScrollController.dispose();

    super.dispose();
  }

  List<String> aggregatorName = [
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy',
    'Swiggy'
  ];
  List<String> branch = [
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode'
  ];
  List<String> commissionType = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem'
  ];
  List<String> commission = [
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00',
    '546.00'
  ];

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
                    scrollController: aggregatorsScrollController,
                    slidingIndicatorPosition: aggregatorsIndicatorPosition,
                    tableDataWidgets: List.generate(aggregatorName.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(450),
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
                                            aggregatorName[index],
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(branch[index],
                                              style: dashBoardTextStyle,
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
                                          child: Text(commissionType[index],
                                              style: dashBoardTextStyle,
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
                                          child: Text(commission[index],
                                              style: dashBoardTextStyle,
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
                    tableRowWidth: 450,
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
                                'Aggregator Name',
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
                            width: AppScreenUtil().screenWidth(95),
                            child: Center(
                              child: Text(
                                'Branch',
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
                              child: Text(
                                'Commission type',
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
                              child: Text(
                                'Commission',
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
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgVisibility,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.imgDisabledEdit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDisabledDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
