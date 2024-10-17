// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/editableTable.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/pos_table.dart';
import '../../../../../../widgets/reason_textfield.dart';

class Return extends StatefulWidget {
  const Return({super.key});

  @override
  State<Return> createState() => _ReturnState();
}

class _ReturnState extends State<Return> {
  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
  }

  int _selectedRadio = 0;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;

  List<String> returnDate = [
    '24/04/2023',
    '24/04/2023',
    '24/04/2023',
    '24/04/2023',
    '24/04/2023',
    '24/04/2023',
  ];
  List<String> transactionId = [
    'AXD354325',
    'AXD354325',
    'AXD354325',
    'AXD354325',
    'AXD354325',
    'AXD354325',
  ];
  List<String> productName = [
    'Oil',
    'Oil',
    'Oil',
    'Oil',
    'Oil',
    'Oil',
  ];
  List<String> qty = [
    '150',
    '150',
    '150',
    '150',
    '150',
    '150',
  ];
  List<String> rate = [
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
  ];
  List<String> amount = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
  ];
  List<String> tax = [
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
  ];
  List<String> returnQty = [
    '50',
    '50',
    '50',
    '50',
    '50',
    '50',
  ];
  List<String> returnRate = [
    '100',
    '100',
    '100',
    '100',
    '100',
    '100',
  ];
  List<String> returnAmount = [
    '5000',
    '5000',
    '5000',
    '5000',
    '5000',
    '5000',
  ];
  List<String> returnReason = [
    'Lorem',
    '5000',
    '5000',
    '5000',
    '5000',
    '5000',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            activeColor: blackColor,
                            focusColor: blackColor,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            groupValue: _selectedRadio,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text(
                            'Order',
                            style: bookedTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            activeColor: blackColor,
                            focusColor: blackColor,
                            value: 1,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            groupValue: _selectedRadio,
                            visualDensity: VisualDensity.compact,
                            onChanged: _handleRadioValueChange,
                          ),
                          Text(
                            'Delivery',
                            style: bookedTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: TextEditingController(),
                          title: 'Transaction ID'),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child: CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Customer',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Invoice',
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
                          controller: TextEditingController(),
                          title: 'Paid Amount'),
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                SizedBox(
                  width: AppScreenUtil().screenWidth(155),
                  child: CustomTextFieldWithTitle(
                      controller: TextEditingController(),
                      title: 'Default Location'),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ColoredTextField(color: detailFullColor,
                          controller: TextEditingController(),
                          title: 'Invoice ID'),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: ColoredTextField(color: detailFullColor,
                          controller: TextEditingController(),
                          title: 'Return Date'),
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ColoredTextField(color: detailFullColor,
                          controller: TextEditingController(),
                          title: 'Product Code'),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: ColoredTextField(color: detailFullColor,
                          controller: TextEditingController(),
                          title: 'Product Name'),
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Unit'),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(7),
                          ),
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Qty'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Rate'),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(7),
                          ),
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Amount'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Tax'),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenWidth(7),
                          ),
                          Expanded(
                            child: ColoredTextField(color: detailFullColor,
                                controller: TextEditingController(),
                                title: 'Return Qty'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(child: Row(
                      children: [
                        Expanded(
                          child: ColoredTextField(color: detailFullColor,
                              controller: TextEditingController(),
                              title: 'Rate'),
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(7),
                        ),
                        Expanded(
                          child: ColoredTextField(color: detailFullColor,
                              controller: TextEditingController(),
                              title: 'Amount'),
                        ),
                      ],
                    ),),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(3),
                ),
                ReasonTextField(color: detailFullColor,
                    controller: TextEditingController(),
                    title: 'Reason'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(27),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      6,
                      6,
                      6,
                      6,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: inventorySelectionColor),
                    child: Icon(
                      Icons.add,
                      color: redColor,
                      size: 18,
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 40, top: 17),
          child: POSTable(
              tableDataWidgets: List.generate(returnDate.length, (index) {
                return InkWell(
                  child: Container(
                      height: AppScreenUtil().screenHeight(37),
                      width: AppScreenUtil().screenWidth(1030),
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor, width: 0.5),
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(0, 7),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(returnDate[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(transactionId[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(productName[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(qty[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(rate[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(amount[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(tax[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(returnQty[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(returnRate[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(returnAmount[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(returnReason[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, 12),
                              child: Divider(
                                color: rfqTextColor,
                                thickness: 0.2,
                              ),
                            )
                          ],
                        ),
                      )),
                  onTap: () {
                    bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 1030,
              titleWidgets: [
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Return Date',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Transaction ID',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Product Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Qty',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rate',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'tax',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Return Qty',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rate',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reason',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
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
