// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class JournalsList extends StatefulWidget {
  const JournalsList({super.key});

  @override
  State<JournalsList> createState() => _JournalsListState();
}

class _JournalsListState extends State<JournalsList> {
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
  List<String> date = [
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
  List<String> name = [
    'Customer Invoices',
    'Vendor Bills',
    'Inventory Valuation',
    'Cash',
    'Customer Invoices',
    'Vendor Bills',
    'Inventory Valuation',
    'Cash',
    'Customer Invoices',
    'Vendor Bills',
    'Inventory Valuation',
    'Cash',
    'Customer Invoices',
    'Vendor Bills',
    'Inventory Valuation',
    'Cash',
  ];
  List<String> type = [
    'Sales',
    'Purchase',
    'Miscellaneous',
    'Cash',
    'Sales',
    'Purchase',
    'Miscellaneous',
    'Cash',
    'Sales',
    'Purchase',
    'Miscellaneous',
    'Cash',
    'Sales',
    'Purchase',
    'Miscellaneous',
    'Cash',
  ];
  List<String> shortCode = [
    'INV',
    'BILL',
    'STJ',
    'CSH1',
    'INV',
    'BILL',
    'STJ',
    'CSH1',
    'INV',
    'BILL',
    'STJ',
    'CSH1',
    'INV',
    'BILL',
    'STJ',
    'CSH1',
  ];

  List<String> defaultAccount = [
    '299 Product Sale',
    '200 Expense',
    'Lorem',
    '234 Cash',
    '299 Product Sale',
    '200 Expense',
    'Lorem',
    '234 Cash',
    '299 Product Sale',
    '200 Expense',
    'Lorem',
    '234 Cash',
    '299 Product Sale',
    '200 Expense',
    'Lorem',
    '234 Cash',
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
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    productTableController.addListener(() {
      setState(() {
        productIndicatorPosition = (productTableController.offset /
            productTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    productTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 20),
          child: DefaultProductTable(
              visible: true,
              scrollController: productTableController,
              slidingIndicatorPosition: productIndicatorPosition,
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
                                    child:  Text(date[index],
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
                                    child:   Text(type[index],
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child:  Text(shortCode[index],
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
                                    child: Text(defaultAccount[index],
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
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(createdBy[index],
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
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child: Text(
                          'Journal Name',
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
                          'Type',
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
                          'Short Code',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Container(  color: Colors.transparent,
                       width: AppScreenUtil().screenWidth(100),child: Center(
                       child:  Text(
                         'Default Account',
                         style: tableTitleLabelStyle,
                         maxLines: 1,
                       ),
                     ),)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
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
