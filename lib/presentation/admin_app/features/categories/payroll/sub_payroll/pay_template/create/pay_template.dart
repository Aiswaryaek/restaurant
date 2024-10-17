// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/product_table.dart';

class PayTemplate extends StatefulWidget {
  const PayTemplate({super.key});

  @override
  State<PayTemplate> createState() => _PayTemplateState();
}

class _PayTemplateState extends State<PayTemplate> {
  final nameController = TextEditingController();
  final periodAmountController = TextEditingController();
  final calculationAmountController = TextEditingController();
  final monthlyController = TextEditingController();
  final yearlyController = TextEditingController();
  final allowanceAmountController = TextEditingController();
  final allowanceMonthlyController = TextEditingController();
  final allowanceYearlyController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
  List<String> payHead = [
    'Tel ALW',
    'House ALW',
    'Food ALW',
  ];
  List<String> calculationType = [
    '% of Basic',
    '% of Basic',
    'Fixed',
  ];
  List<String> amount = [
    '05.00',
    '05.00',
    '05.00',
  ];
  List<String> monthly = [
    '455.00',
    '455.00',
    '300.00',
  ];
  List<String> yearly = [
    '4500.00',
    '4500.00',
    '30000.00',
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
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: nameController, title: 'Name'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Period',
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
                        controller: periodAmountController, title: 'Amount'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Basic',
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
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Calculation Type',
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
                        controller: calculationAmountController,
                        title: 'Amount'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: monthlyController, title: 'Monthly'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: yearlyController, title: 'Yearly'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Divider(
                color: inventorySelectionColor,
                thickness: 1.5,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Allowances',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Calculation Type',
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
                height: AppScreenUtil().screenHeight(18),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: allowanceAmountController, title: 'Amount'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: allowanceMonthlyController,
                        title: 'Monthly'),
                  ),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        controller: allowanceYearlyController, title: 'Yearly'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              const Divider(
                color: inventorySelectionColor,
                thickness: 1.5,
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 16, bottom: 40, top: 15),
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ///Table heading
                        Container(
                          padding: EdgeInsets.only(bottom: 7),
                          height: AppScreenUtil().screenHeight(20),
                          width: AppScreenUtil().screenWidth(500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: constantWhite,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pay Head',
                                        style: tableTitleLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: AppScreenUtil().screenWidth(100),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Calculation Type',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Amount',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Monthly',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Yearly',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: List.generate(payHead.length, (index) {
                            return InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppScreenUtil().screenWidth(1)),
                                child: Container(
                                  height: AppScreenUtil().screenHeight(30),
                                  width: AppScreenUtil().screenWidth(500),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: tableDataAlternateColor[
                                        index % tableDataAlternateColor.length],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(18)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width:
                                                AppScreenUtil().screenWidth(90),
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  payHead[index],
                                                  style:
                                                      tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width: AppScreenUtil()
                                                .screenWidth(100),
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  calculationType[index],
                                                  style:
                                                      tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width:
                                                AppScreenUtil().screenWidth(90),
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  amount[index],
                                                  style:
                                                      tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width:
                                                AppScreenUtil().screenWidth(90),
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  monthly[index],
                                                  style:
                                                      tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width:
                                                AppScreenUtil().screenWidth(90),
                                            color: Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  yearly[index],
                                                  style:
                                                      tableSubTitleLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                        ),
                        SizedBox(height: AppScreenUtil().screenHeight(12),),
                        Container(
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: payTemplateOtherContainerColor.withOpacity(0.8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Other ALW',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(100),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Fixed',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '100.00',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '150.00',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1250.00',
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
                        SizedBox(height: AppScreenUtil().screenHeight(12),),
                        Container(
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color:blackColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(18)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total',
                                          style: changePassWordAlertButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(100),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1500.00 ',
                                          style: changePassWordAlertButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: AppScreenUtil().screenWidth(90),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '500000.00',
                                          style: changePassWordAlertButtonLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
