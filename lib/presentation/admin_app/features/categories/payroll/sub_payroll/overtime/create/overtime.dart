// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/overtime/create/add_overtime.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/product_table.dart';
import '../../../../../../widgets/time_picker_textfield.dart';

class Overtime extends StatefulWidget {
  const Overtime({super.key});

  @override
  State<Overtime> createState() => _OvertimeState();
}

class _OvertimeState extends State<Overtime> {
  final overtimeAmountController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final createDateController = TextEditingController();
  final durationController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  bool overTimeContainer = false;
  bool onTapped = false;

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  int hours = 1;

  void incrementHours() {
    setState(() {
      hours = (hours + 1) % 24;
    });
  }

  void decrementHours() {
    setState(() {
      hours = (hours - 1) % 24;
      if (hours < 0) {
        hours = 23;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return onTapped == false
        ? Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'OVRT/2023/10/0001',
                    style: billTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Employee',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child: CustomTextFieldWithDate(
                      controller: createDateController,
                      title: 'Create Date',
                      onTap: () async {
                        dateSelection(controller: createDateController);
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
                        child: Column(
                      children: [
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Overtime Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                onTapped = true;
                              });
                            },
                            child: Text(
                              'Add Overtime Type',
                              style: mainRedTextStyle,
                            ),
                          ),
                        )
                      ],
                    )),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: Transform.translate(
                          offset: Offset(0, -7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duration',
                                style: bookedTextStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(8),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: whiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: searchTextColor,
                                        offset: Offset(0, 0),
                                        blurRadius: 1,
                                      ),
                                    ]),
                                child: SizedBox(
                                  height: 37,
                                  child: TextField(
                                    style: searchInputTextStyle,
                                    controller: TextEditingController(
                                        text: hours.toString() + ' Hour'),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        suffixIcon: GestureDetector(
                                            onTap: incrementHours,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: 1,
                                              ),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                      onTap: incrementHours,
                                                      child:
                                                          Transform.translate(
                                                        offset: Offset(0, 3),
                                                        child: Icon(
                                                          Icons.arrow_drop_up,
                                                          size: 18,
                                                          color: blackColor,
                                                        ),
                                                      )),
                                                  InkWell(
                                                      onTap: decrementHours,
                                                      child:
                                                          Transform.translate(
                                                        offset: Offset(0, -2),
                                                        child: Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 18,
                                                          color: blackColor,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide:
                                              BorderSide(color: whiteColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide:
                                              BorderSide(color: whiteColor),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide:
                                              BorderSide(color: whiteColor),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide:
                                              BorderSide(color: whiteColor),
                                        ),
                                        labelText: ""),
                                    readOnly: true,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Unit Type',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: amountController, title: 'Amount'),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFieldWithTitle(
                            controller: overtimeAmountController,
                            title: 'Overtime Amount'),
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppScreenUtil().screenHeight(29),
                          ),
                          Text(
                            'Description',
                            style: bookedTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(8),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: searchTextColor,
                                    offset: Offset(0, 0),
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: SizedBox(
                                height: 69,
                                child: TextField(
                                  controller: descriptionController,
                                  maxLines: 10,
                                  style: searchInputTextStyle,
                                  textAlign: TextAlign.center,
                                  cursorColor: whiteColor,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    hintStyle: placeholderTextStyle,
                                    fillColor: blackColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: whiteColor),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(10),
                ),
                Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      overTimeContainer = !overTimeContainer;
                    });
                  },

                  ///Main container
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    // decoration: BoxDecoration(
                    //     borderRadius: widget.borderRadius, color:widget.tableColor?? Colors.transparent),
                    height: (overTimeContainer == false)
                        ? AppScreenUtil().screenHeight(40)
                        : MediaQuery.of(context).size.height / 1.8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ///Title container
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 13, 20, 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color:
                                    branchTransferCreateColor.withOpacity(0.8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Employee previous OT details',
                                  style: toggleTextStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      overTimeContainer == false
                                          ? 'Show'
                                          : 'Hide',
                                      style: cancelTextStyle,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(2),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 1),
                                      child: Icon(
                                        overTimeContainer == false
                                            ? Icons.keyboard_arrow_down_outlined
                                            : Icons.keyboard_arrow_up_outlined,
                                        color: cancelColor,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 13, 20, 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      AppScreenUtil().screenWidth(7)),
                                  bottomRight: Radius.circular(
                                      AppScreenUtil().screenWidth(7)),
                                ),
                                color:
                                    branchTransferCreateColor.withOpacity(0.8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              2, // Number of columns
                                          crossAxisSpacing:
                                              15, // Spacing between columns
                                          mainAxisSpacing: 15,
                                          childAspectRatio:
                                              4 / 3.2 // Spacing between rows
                                          ),
                                  itemCount: 4,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: double.infinity,
                                      color: branchTransferCreateColor
                                          .withOpacity(0.8),
                                      child: DottedBorder(
                                          dashPattern: [10, 6],
                                          color:
                                              rolesAndPermissionsDropDownBorderColor
                                                  .withOpacity(0.4),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 9, 10, 9),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '03/15/2023',
                                                  style: overTimeDateTextStyle,
                                                ),
                                                SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(10),
                                                ),
                                                Text(
                                                  'OT - 2 Hrs',
                                                  style: toggleTextStyle,
                                                ),
                                                SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(6),
                                                ),
                                                Text(
                                                  'Amount/Hr - 10.00',
                                                  style: toggleTextStyle,
                                                ),
                                                SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(6),
                                                ),
                                                Text(
                                                  'Total - 20.00',
                                                  style: toggleTextStyle,
                                                )
                                              ],
                                            ),
                                          )),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(14),
                                ),
                                Text(
                                  'Net Pay Amount',
                                  style: overTimeNetPayTextStyle,
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(5),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rs 50000.00',
                                      style: cancelTextStyle,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(2),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 1),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: cancelColor,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : AddOverTime();
  }
}
