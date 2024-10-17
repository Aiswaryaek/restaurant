import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_bottom_sheet_item_layout.dart';

import 'package:restaurant/presentation/admin_app/widgets/inventory_table_layout_without_scroll.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class BranchSettingsList extends StatefulWidget {
  const BranchSettingsList({super.key});

  @override
  State<BranchSettingsList> createState() => _BranchSettingsListState();
}

class _BranchSettingsListState extends State<BranchSettingsList> {
  ScrollController branchSettingsTableController = ScrollController();
  double branchSettingsIndicatorPosition = 0.0;
  List<String> branchList = [
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS'
  ];
  List<String> locationList = [
    'Kozhikode',
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

  List<String> paymentTypeList = [
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash'
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];


  @override
  void initState() {
    branchSettingsTableController.addListener(() {
      setState(() {
        branchSettingsIndicatorPosition = (branchSettingsTableController.offset /
                branchSettingsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    branchSettingsTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Scrolling layout

        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(16),
            ),
            child: InventoryTableLayoutWithoutScroll(
                scrollIndicatorVisibility: false,
                tableHeight: MediaQuery.of(context).size.height / 2,
                scrollController: branchSettingsTableController,
                slidingIndicatorPosition: branchSettingsIndicatorPosition,
                tableDataWidgets: List.generate(branchList.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(350),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child: Text(
                                        branchList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(locationList[index],
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
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        paymentTypeList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      bottomBar(context);
                    },
                  );
                }),
                tableRowWidth: 350,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(80),
                        child: Center(
                          child:  Text(
                            'Branch',
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
                        width: AppScreenUtil().screenWidth(90),
                        child: Center(
                          child:  Text(
                            'Location',
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
                        width: AppScreenUtil().screenWidth(90),
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
                ]),
          ),
        )
      ],
    );
  }
///Table data widget ontap bottombar
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: const BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)
                ),
          ),
          child: Column(
            children: [
              ///Divider layout
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: const Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),

              ///Bottomsheet item layout
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgVisibility,
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
