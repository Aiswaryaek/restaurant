import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/controller/purchase_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../user_app/widgets/custom_button.dart';
import '../single_view/grn_single_view.dart';

class GrnList extends StatefulWidget {
  const GrnList({super.key});

  @override
  State<GrnList> createState() => _GrnListState();
}

class _GrnListState extends State<GrnList> {
  ScrollController grnTableScrollController = ScrollController();
  double grnTableIndicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    grnTableScrollController.addListener(() {
      setState(() {
        grnTableIndicatorPosition = (grnTableScrollController.offset /
                grnTableScrollController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    grnTableScrollController.dispose();

    super.dispose();
  }

  List<String> nameList = ['GRNWH001', 'GRNWH001', 'GRNWH001', 'GRNWH001'];
  List<String> dateList = [
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023'
  ];
  List<String> branchList = ['OOPACKS', 'OOPACKS', 'OOPACKS', 'OOPACKS'];
  List<String> locationList = ['Kakkanad', 'Kakkanad', 'Kakkanad', 'Kakkanad'];
  List<String> venderList = ['Cyber', 'Cyber', 'Cyber', 'Cyber'];
  List<String> createdByList = ['Sajan', 'Sajan', 'Sajan', 'Sajan'];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  List<String> alternateArrowImagePath = [
    ImageCons.imgStocksDownArrow,
    ImageCons.imgStocksUpArrow
  ];
  List<Color> alternateButtonColor = [
    draftButtonColor.withOpacity(0.5),
    postedButtonColor
  ];
  List<String> alternateButtonText = ['Draft', 'Posted'];
  final PurchaseController purchaseCtrl = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return purchaseCtrl.grnSingleViewTapped.value == true
        ? const GRNSingleView()
        : Column(
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenHeight(15),
                          left: AppScreenUtil().screenWidth(16)),
                      child: InventoryTableLayout(
                          scrollController: grnTableScrollController,
                          slidingIndicatorPosition: grnTableIndicatorPosition,
                          tableDataWidgets:
                              List.generate(dateList.length, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppScreenUtil().screenWidth(5)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    purchaseCtrl.grnSingleViewTapped.value =
                                        true;
                                  });
                                },
                                child: Container(
                                  height: AppScreenUtil().screenHeight(36),
                                  width: AppScreenUtil().screenWidth(740),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: tableDataAlternateColor[
                                        index % tableDataAlternateColor.length],
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
                                        ///Product id data
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(
                                                  nameList[index],
                                                  style: dashBoardTextStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(dateList[index],
                                                    style: dashBoardTextStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
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
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(branchList[index],
                                                    style: dashBoardTextStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
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
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(locationList[index],
                                                    style: dashBoardTextStyle,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(venderList[index],
                                                    style: dashBoardTextStyle,
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
                                              width: AppScreenUtil()
                                                  .screenWidth(80),
                                              child: Center(
                                                child: Text(
                                                    createdByList[index],
                                                    style: dashBoardTextStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            color: Colors.transparent,
                                            width:
                                                AppScreenUtil().screenWidth(80),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                    buttonHeight:
                                                        AppScreenUtil()
                                                            .screenHeight(18),
                                                    buttonWidth: AppScreenUtil()
                                                        .screenWidth(60),
                                                    buttonColor:
                                                        alternateButtonColor[index %
                                                            alternateButtonColor
                                                                .length],
                                                    borderRadius: 6,
                                                    buttonText:
                                                        alternateButtonText[index %
                                                            alternateButtonText
                                                                .length],
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
                          tableRowWidth: 740,
                          titleWidgets: [
                            ///Date heading
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
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

                            ///Name heading

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

                            ///From heading

                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Branch',
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
                                    'Location',
                                    style: tableTitleLabelStyle,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),

                            ///Contact heading

                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(80),
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
