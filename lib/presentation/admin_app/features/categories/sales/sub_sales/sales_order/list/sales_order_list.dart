// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class SalesOrderList extends StatefulWidget {
  const SalesOrderList({super.key});

  @override
  State<SalesOrderList> createState() => _SalesOrderListState();
}

class _SalesOrderListState extends State<SalesOrderList> {
  ScrollController salesOrderController = ScrollController();
  double salesIndicatorPosition = 0.0;
  List<String> date = [
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
    '23/09/2023',
  ];
  List<String> name = [
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
    'PO/2023/10/0001',
  ];
  List<String> customer = [
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
    'Name Of Customer',
  ];
  List<String> total = [
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
    '1000.00',
  ];



  List<String> createdBy = [
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
    'Leeyet',
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
    salesOrderController.addListener(() {
      setState(() {
        salesIndicatorPosition = (salesOrderController.offset /
            salesOrderController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    salesOrderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(16), bottom: AppScreenUtil().screenHeight(15)),
          child: DefaultProductTable(
              visible: true,
              scrollController: salesOrderController,
              slidingIndicatorPosition: salesIndicatorPosition,
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(700),
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(date[index],
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
                                  width: AppScreenUtil().screenWidth(140),
                                  child: Center(
                                    child:  Text(name[index],
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
                                    child:  Text(customer[index],
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
                                    child:  Text(createdBy[index],
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
                                              :status[index] == 'Posted'
                                              ? postedButtonColor
                                              .withOpacity(0.9): confirmColor
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
              tableRowWidth: 700,
              titleWidgets: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(140),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(110),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:   Text(
                          'Total',
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
                      width: AppScreenUtil().screenWidth(110),
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
