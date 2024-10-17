// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../widgets/product_table.dart';

class AddExpenseType extends StatefulWidget {
  const AddExpenseType({super.key});

  @override
  State<AddExpenseType> createState() => _AddExpenseTypeState();
}

class _AddExpenseTypeState extends State<AddExpenseType> {
  final docNoController = TextEditingController();
  final expenseTypeController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController addExpenseTypeTableController = ScrollController();
  double addExpenseTypeIndicatorPosition = 0.0;
  List<String> docNo = [
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
    'DOC01',
  ];
  List<String> expenseType = [
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
    'Sales Expense',
  ];
  List<String> expenseAccount = [
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
    'Sales Expense Account',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: docNoController, title: 'Doc No'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: expenseTypeController,
                        title: 'Expense Type'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Expense Account',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: inventoryCreateButtonLabelStyle,
                          textAlign: TextAlign.center),
                    )),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 30),
          child: DefaultProductTable(
              visible: false,
              scrollController: addExpenseTypeTableController,
              slidingIndicatorPosition: addExpenseTypeIndicatorPosition,
              tableDataWidgets: List.generate(docNo.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(400),
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
                                      child: Text(
                                        docNo[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
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
                                        expenseType[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
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
                                        expenseAccount[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
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
              tableRowWidth: 400,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Doc No',
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
                        'Expense Type',
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
                        'Expense Account',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ]),
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
