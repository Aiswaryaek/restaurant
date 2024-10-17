// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({super.key});

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  ScrollController purchaseTableController = ScrollController();
  double purchaseIndicatorPosition = 0.0;
  List<String> date = [
    'ABC12345',
    'ABC12345',
    'ABC12345',
    'ABC12345',
    'ABC12345',
  ];
  List<String> name = [
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
    'BILL/2023/10/0001',
  ];
  List<String> vendor = [
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
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
  ];
  List<String> billDate = [
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
    '12/05/2023',
  ];

  List<String> billReference = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
  ];

  List<String> total = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
  ];

  List<String> createdBy = [
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
    'Nihad',
  ];
  List<String> status = [
    'Draft',
    'Posted',
    'Cancel',
    'Draft',
    'Posted',
    'Cancel',
    'Draft',
    'Posted',
    'Cancel',
    'Draft',
    'Posted',
    'Cancel',
    'Draft',
    'Posted',
    'Cancel',
    'Draft',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    purchaseTableController.addListener(() {
      setState(() {
        purchaseIndicatorPosition = (purchaseTableController.offset /
                purchaseTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    purchaseTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: AppScreenUtil().screenWidth(16),
              bottom: AppScreenUtil().screenHeight(15)),
          child: DefaultProductTable(
              visible: true,
              scrollController: purchaseTableController,
              slidingIndicatorPosition: purchaseIndicatorPosition,
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(860),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(5)),

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
                                  child: Center(child:  Text(date[index],
                                      style: dashBoardTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child: Text(name[index],
                                        style: dashBoardTextStyle,
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(vendor[index],
                                        style: dashBoardTextStyle,
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
                                  width: AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child:  Text(billDate[index],
                                        style: dashBoardTextStyle,
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
                                  width: AppScreenUtil().screenWidth(110),
                                  child: Center(
                                    child:   Text(billReference[index],
                                        style: dashBoardTextStyle,
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:  Text(total[index],
                                        style: dashBoardTextStyle,
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
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child:   Text(createdBy[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(bottom: 2),
                                        width: AppScreenUtil().screenWidth(65),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: status[index] == 'Draft'
                                              ? draftButtonColor
                                                  .withOpacity(0.5)
                                              : status[index] == 'Posted'
                                                  ? postedButtonColor
                                                      .withOpacity(0.9)
                                                  : confirmColor
                                                      .withOpacity(0.5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            status[index],
                                            style:
                                                inventoryCreateButtonLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ],
                                )),
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
              tableRowWidth: 860,
              titleWidgets: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(120),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:  Text(
                          'Vendor',
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
                      width: AppScreenUtil().screenWidth(95),
                      child: Center(
                        child: Text(
                          'Bill Date',
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
                      width: AppScreenUtil().screenWidth(110),
                      child: Center(
                        child: Text(
                          'Bill Reference',
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
                    Container( color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),child: Center(
                        child: Text(
                          'Total',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:   Text(
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
                      width: AppScreenUtil().screenWidth(110),
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
              ]),
        )
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
