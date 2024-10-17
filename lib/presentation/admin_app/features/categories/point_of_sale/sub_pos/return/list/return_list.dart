// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class ReturnList extends StatefulWidget {
  const ReturnList({super.key});

  @override
  State<ReturnList> createState() => _ReturnListState();
}

class _ReturnListState extends State<ReturnList> {
  ScrollController returnTableController = ScrollController();
  double returnIndicatorPosition = 0.0;
  List<String> invoice = [
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
    'ABC565435',
  ];
  List<String> customer = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String> contact = [
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
    '8856774454',
  ];
  List<String> date = [
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
    '12/09/2023',
  ];
  List<String> salesTotal = [
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
  ];
  List<String> returnTotal = [
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
    '11,5214,00',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    returnTableController.addListener(() {
      setState(() {
        returnIndicatorPosition = (returnTableController.offset /
            returnTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    returnTableController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15,bottom: 20),
          child: DefaultProductTable( visible: true,
              scrollController: returnTableController,
              slidingIndicatorPosition: returnIndicatorPosition,
              tableDataWidgets: List.generate(invoice.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                    EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(665),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                        index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(4)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Product id data
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child: Text(invoice[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child:  Text(customer[index],
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
                                    child:   Text(contact[index],
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
                                  width: AppScreenUtil().screenWidth(95),
                                  child: Center(
                                    child: Text(salesTotal[index],
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
                                    child: Text(returnTotal[index],
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
              tableRowWidth: 665,
              titleWidgets: [
                ///Product id heading
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Invoice',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),

                ///Product name heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Customer',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),

                ///Product image heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Contact',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),

                ///Product uom heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Date',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                ///Variant heading

                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sales Total',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Return Total',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
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
