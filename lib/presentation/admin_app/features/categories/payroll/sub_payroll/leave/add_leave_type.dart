// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../widgets/inventory_table_layout_without_scroll.dart';

class AddLeaveType extends StatefulWidget {
  const AddLeaveType({super.key});

  @override
  State<AddLeaveType> createState() => _AddLeaveTypeState();
}

class _AddLeaveTypeState extends State<AddLeaveType> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final leaveTypeController = TextEditingController();
  final noOfDaysController = TextEditingController();
  List<Color> tableDataAlternateColor = [
    payslipGridContainerColor.withOpacity(0.8),
    constantWhite,
  ];

  List<String> leaveType = [
    'Sick Leave',
    'Casual Leave',
    'Maternity Leave',
  ];

  List<String> paidOrUnpaid = [
    'Paid',
    'Paid',
    'Paid',
  ];
  List<String> noOfDays = [
    '12',
    '12',
    '12',
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
                        controller: leaveTypeController, title: 'Leave Type'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: noOfDaysController, title: 'No. of Days'),
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
                    title: 'Paid/Unpaid',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
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
                  tableDataWidgets: List.generate(leaveType.length, (index) {
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
                                          leaveType[index],
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
                                          noOfDays[index],
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
                                          paidOrUnpaid[index],
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
