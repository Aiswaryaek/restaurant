// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class SalaryDisbursementList extends StatefulWidget {
  const SalaryDisbursementList({super.key});

  @override
  State<SalaryDisbursementList> createState() => _SalaryDisbursementListState();
}

class _SalaryDisbursementListState extends State<SalaryDisbursementList> {
  ScrollController salaryDisbursementController = ScrollController();
  double salaryDisbursementIndicatorPosition = 0.0;
  List<String> name = [
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
    'EOS/2023/10/0001',
  ];
  List<String> accountingDate = [
    '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
     '24/08/2023',
  ];
  List<String> paymentMethod = [
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
  ];
  List<String> paymentType = [
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
    'Manual',
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
    salaryDisbursementController.addListener(() {
      setState(() {
        salaryDisbursementIndicatorPosition = (salaryDisbursementController.offset /
            salaryDisbursementController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    salaryDisbursementController.dispose();
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
              scrollController: salaryDisbursementController,
              slidingIndicatorPosition: salaryDisbursementIndicatorPosition,
              tableDataWidgets: List.generate(name.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(638),
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
                                  width: AppScreenUtil().screenWidth(110),
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
                                  width: AppScreenUtil().screenWidth(120),
                                  child: Center(
                                    child: Text(accountingDate[index],
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
                                    child: Text(paymentMethod[index],
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
                                    child:  Text(paymentType[index],
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
              tableRowWidth: 638,
              titleWidgets: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(110),
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
                      width: AppScreenUtil().screenWidth(120),
                      child: Center(
                        child: Text(
                          'Accounting Date',
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
                      width: AppScreenUtil().screenWidth(130),
                      child: Center(
                        child:  Text(
                          'Payment Method',
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
                      width: AppScreenUtil().screenWidth(130),
                      child: Center(
                        child: Text(
                          'Payment Type',
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
