// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class BankConciliationList extends StatefulWidget {
  const BankConciliationList({super.key});

  @override
  State<BankConciliationList> createState() => _BankConciliationListState();
}

class _BankConciliationListState extends State<BankConciliationList> {
  ScrollController bankConciliationController = ScrollController();
  double bankConciliationIndicatorPosition = 0.0;
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
  List<String> journal = [
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
    'CBQ Bank',
  ];
  List<String> reference = [
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
    'CBQ Bank Reconciliation',
  ];
  List<String> reConciliatedAmount = [
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
    'AED 5000.00',
  ];

  List<String> bankCharge = [
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
    'AED 15.00',
  ];

  List<String> status = [
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
    'Draft',
    'Posted',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    bankConciliationController.addListener(() {
      setState(() {
        bankConciliationIndicatorPosition = (bankConciliationController.offset /
            bankConciliationController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    bankConciliationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 30),
          child: DefaultProductTable(
              visible: true,
              scrollController: bankConciliationController,
              slidingIndicatorPosition: bankConciliationIndicatorPosition,
              tableDataWidgets: List.generate(date.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(750),
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
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child: Text(journal[index],
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
                                  width: AppScreenUtil().screenWidth(130),
                                  child: Center(
                                      child:  Text(reference[index],
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
                                  width: AppScreenUtil().screenWidth(130),
                                  child: Center(
                                    child:  Text(reConciliatedAmount[index],
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
                                    child:   Text(bankCharge[index],
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
                                              .withOpacity(0.4)
                                              :  postedButtonColor
                                              .withOpacity(0.9),
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
              tableRowWidth: 750,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
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
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Journal',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(130),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reference',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(130),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reconciliated Amount',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(110),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bank Charge',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(110),
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
