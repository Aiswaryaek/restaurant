// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/inventory_table_layout_without_scroll.dart';

class AddOverTime extends StatefulWidget {
  const AddOverTime({super.key});

  @override
  State<AddOverTime> createState() => _AddOverTimeState();
}

class _AddOverTimeState extends State<AddOverTime> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final otTypeController = TextEditingController();
  final amountController = TextEditingController();
  List<Color> tableDataAlternateColor = [
    payslipGridContainerColor.withOpacity(0.8),
    constantWhite,
  ];

  List<String> otName = [
    'Normal OT',
    'Holidays',
  ];

  List<String> amountType = [
    'Hours',
    'Year',
  ];
  List<String> amount = [
    '15',
    '250',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: otTypeController, title: 'OT Type'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: _dropdownItems,
                        title: 'Amount Type',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      )),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: amountController, title: 'Amount'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(child: Container())
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Divider(
                color: inventorySelectionColor,
                thickness: 1.5,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              InventoryTableLayoutWithoutScroll(
                  scrollIndicatorVisibility: false,
                  tableDataWidgets: List.generate(otName.length, (index) {
                    return InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(0)),
                        child: Container(
                          height: AppScreenUtil().screenHeight(36),
                          width: AppScreenUtil().screenWidth(350),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          otName[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          amountType[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          amount[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 350,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Leave Type',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No. of Days',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Paid/Unpaid',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
              SizedBox(height: AppScreenUtil().screenHeight(13),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Cancel',
                            style: categoryMenuTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(8),
                  ),
                  InkWell(
                    child: Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: blackColor)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Submit',
                              style: confirmTextStyle,
                              textAlign: TextAlign.center),
                        )),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
