// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class InventoryAdjustmentList extends StatefulWidget {
  const InventoryAdjustmentList({super.key});

  @override
  State<InventoryAdjustmentList> createState() =>
      _InventoryAdjustmentListState();
}

class _InventoryAdjustmentListState extends State<InventoryAdjustmentList> {
  ScrollController inventoryAdjustmentTableScrollController =
      ScrollController();
  double inventoryAdjustmentTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    inventoryAdjustmentTableScrollController.addListener(() {
      setState(() {
        inventoryAdjustmentTableIndicatorPosition =
            (inventoryAdjustmentTableScrollController.offset /
                    inventoryAdjustmentTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    inventoryAdjustmentTableScrollController.dispose();

    super.dispose();
  }

  List<String> adjustmentDate = [
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
  ];
  List<String> name = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
  ];
  List<String> branch = [
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
    'Calicut',
  ];
  List<String> location = [
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
  ];
  List<String> createdBy = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String> status = [
    'Done',
    'Requested',
    'In Progress',
    'Requested',
    'In Progress',
    'Requested',
    'Done',
    'Requested',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  List<Color> alternateStatusColor = [
    bankReceiptButtonColorGreen.withOpacity(0.6),
    bankReceiptButtonColorRed.withOpacity(0.5)
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
                    scrollController: inventoryAdjustmentTableScrollController,
                    slidingIndicatorPosition:
                        inventoryAdjustmentTableIndicatorPosition,
                    tableDataWidgets:
                        List.generate(adjustmentDate.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: () {
                            bottomBar(context);
                          },
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
                                            adjustmentDate[index],
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
                                          child: Text(name[index],
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
                                          child: Text(branch[index],
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
                                          child: Text(location[index],
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
                                          child: Text(createdBy[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(75),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 3),
                                            width:
                                                AppScreenUtil().screenWidth(60),
                                            height: AppScreenUtil()
                                                .screenHeight(18),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: status[index] == 'Done'
                                                  ? adminDashBoardLineGraphGradient1Color
                                                      .withOpacity(0.8)
                                                  : status[index] == 'Requested'
                                                      ? totalAttendanceLabelColor.withOpacity(0.8)
                                                      : upComingHolidaysColor3.withOpacity(0.8)  ,
                                            ),
                                            child: Text(
                                              status[index],
                                              style:
                                                  cartSelectedTabLabelTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          )
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
                                'Adjustment Date',
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
                              child: Text(
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
                              child: Text(
                                'Branch',
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
                                'Location',
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
                        iconPath: ImageCons.imgDisabledView,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
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
