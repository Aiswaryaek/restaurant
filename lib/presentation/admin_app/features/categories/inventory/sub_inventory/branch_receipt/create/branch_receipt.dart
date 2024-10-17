// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

import '../../../../../../widgets/edit_textfield.dart';
import '../../../../../../widgets/editableTable.dart';

class BranchReceipt extends StatefulWidget {
  const BranchReceipt({super.key});

  @override
  State<BranchReceipt> createState() => _BranchReceiptState();
}

class _BranchReceiptState extends State<BranchReceipt> {
  String? _selectedItem;
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  final contactPersonController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedHandQty = false;
  dynamic tappedTransferQty = false;
  List<String> productsList = [
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
    'Current Asset',
  ];
  List<String> uomList = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<String> descriptionList = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<String> onHandQtyList = [
    '10',
    '10',
    '10',
    '10',
    '10',
  ];
  List<String> transferQtyList = [
    '8',
    '8',
    '8',
    '8',
    '8',
  ];
  List<String> spmargin = [
    '20%',
    '20%',
    '20%',
    '20%',
    '20%',
  ];
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
///
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, -6),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'BILL/2023/10/0001',
                      style: billTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Branch',
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
                      title: 'Warehouse',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ))
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
                      title: 'Source Location',
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
                      title: 'Destination Location',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ))
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CustomTextFieldWithDate(
                      controller: dateinput,
                      title: 'Date',
                      onTap: () async {
                        dateSelection(controller: dateinput);
                      },
                    )),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child: CustomTextFieldWithTitle(
                            controller: referenceController,
                            title: 'Reference'))
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                CustomTextFieldWithTitle(
                    controller: contactPersonController, title: 'Contact Person'),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: EditableTable(
              tableDataWidgets: List.generate(productsList.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(37),
                    width: AppScreenUtil().screenWidth(558),
                    decoration: BoxDecoration(
                      border: Border.all(color: inventorySelectionColor),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(18)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    tappedProducts == false
                                        ? Text(
                                            productsList[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: AppScreenUtil()
                                                    .screenWidth(95),
                                                child: editableTextField(
                                                    setState,
                                                    referenceController),
                                              )
                                            ],
                                          )
                                  ],
                                )),
                            onTap: () {
                              setState(() {
                                tappedProducts = true;
                              });
                              print('tapped Item to Edit: $tappedProducts');
                            },
                          ),
                          InkWell(
                            child: tappedUom == false
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(85),
                                  child: Center(
                                    child: Text(descriptionList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(95),
                                        child: editableTextField(
                                            setState, referenceController),
                                      ),
                                    ],
                                  ),
                            onTap: () {
                              setState(() {
                                tappedUom = true;
                              });
                              print('tapped Item to Edit: ${tappedUom}');
                            },
                          ),
                          InkWell(
                            child: tappedHandQty == false
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(85),
                                  child: Center(
                                    child:  Text(uomList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(95),
                                        child: editableTextField(
                                            setState, referenceController),
                                      ),
                                    ],
                                  ),
                            onTap: () {
                              setState(() {
                                tappedHandQty = true;
                              });
                              print('tapped Item to Edit: ${tappedHandQty}');
                            },
                          ),
                          InkWell(
                            child: tappedTransferQty == false
                                ?  Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(85),
                                  child: Center(
                                    child: Text(spmargin[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(95),
                                        child: editableTextField(
                                            setState, referenceController),
                                      ),
                                    ],
                                  ),
                            onTap: () {
                              setState(() {
                                tappedTransferQty = true;
                              });
                              print('tapped Item to Edit: $tappedTransferQty');
                            },
                          ),
                          InkWell(
                            child: tappedTransferQty == false
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(85),
                                  child: Center(
                                    child: Text(onHandQtyList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(95),
                                        child: editableTextField(
                                            setState, referenceController),
                                      ),
                                    ],
                                  ),
                            onTap: () {
                              setState(() {
                                tappedTransferQty = true;
                              });
                              print('tapped Item to Edit: $tappedTransferQty');
                            },
                          ),
                          InkWell(
                            child: tappedTransferQty == false
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(85),
                                  child: Center(
                                    child:  Text(transferQtyList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppScreenUtil().screenWidth(95),
                                        child: editableTextField(
                                            setState, referenceController),
                                      ),
                                    ],
                                  ),
                            onTap: () {
                              setState(() {
                                tappedTransferQty = true;
                              });
                              print('tapped Item to Edit: $tappedTransferQty');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
              tableRowWidth: 558,
              titleWidgets: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Center(
                        child: Text(
                          'Product',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                      width: AppScreenUtil().screenWidth(85),
                      child: Center(
                        child:  Text(
                          'Description',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                      width: AppScreenUtil().screenWidth(85),
                      child: Center(
                        child: Text(
                          'UOM',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                      width: AppScreenUtil().screenWidth(85),
                      child: Center(
                        child: Text(
                          'SP Margin',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                      width: AppScreenUtil().screenWidth(85),
                      child: Center(
                        child: Text(
                          'On Hand Qty',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                      width: AppScreenUtil().screenWidth(85),
                      child: Center(
                        child: Text(
                          'Transfer Qty',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(130),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: backGroundColor,
                  ),
                  child: SizedBox(
                    height: 36,
                    child: DropdownButton<String>(
                      dropdownColor: inventorySelectionColor,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      value: selected,
                      items: dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: subTitleTextStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Update the selected item
                        setState(() {
                          selected = newValue;
                        });

                        // Print or use the selected item
                        print('Selected item: $selected');
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: subTextInventoryColor,
                      ),
                      iconSize: 20,
                      hint: Text(
                        'Add Line',
                        style: cartItemTitleStyle,
                      ),
                      isExpanded: true,
                      underline: SizedBox(), // Removes the default underline
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(10),
              ),
              Container(
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
                  size: 16,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
