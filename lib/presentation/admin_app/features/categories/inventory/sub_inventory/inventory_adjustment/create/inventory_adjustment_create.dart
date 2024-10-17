// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_drop_down_without_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/edit_textfield.dart';
import '../../../../../../widgets/editableTable.dart';

class InventoryAdjustmentCreateScreen extends StatefulWidget {
  const InventoryAdjustmentCreateScreen({super.key});

  @override
  State<InventoryAdjustmentCreateScreen> createState() =>
      _InventoryAdjustmentCreateScreenState();
}

class _InventoryAdjustmentCreateScreenState
    extends State<InventoryAdjustmentCreateScreen> {

  String? _selectedItem;
  String? selected;
  dynamic _selectedProduct;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedLocation = false;
  dynamic tappeOnHandQty = false;
  dynamic tappedRealQty = false;

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
  List<String> locationList = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
  ];
  List<String> onHandQtyList = [
    '10',
    '10',
    '10',
    '10',
    '10',
  ];
  List<String> realQtyList = [
    '8',
    '8',
    '8',
    '8',
    '8',
  ];

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

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
  int? selectedOption= 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'BILL/2023/10/0001',
                    style: billTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
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
                          title: 'Location',
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
                          title: 'Adjustment Date',
                          onTap: () async {
                            dateSelection(controller: dateinput);
                          },
                        )),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child: CustomTextFieldWithDate(
                          controller: dateinput,
                          title: 'Accounting Date',
                          onTap: () async {
                            dateSelection(controller: dateinput);
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Transform.translate(
                  offset: Offset(0, -32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child:
                          CustomTextFieldWithTitle(
                              controller: referenceController,
                              title: 'Reference')
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                        child: Transform.translate(
                          offset: Offset(-1, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adjustment Of',
                                style: bookedTextStyle,
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(8),
                              ),
                              Transform.translate(
                                offset: Offset(-5, 0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    ///All products radio button
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Radio<int>(
                                          activeColor: blackColor,
                                          materialTapTargetSize:
                                          MaterialTapTargetSize
                                              .shrinkWrap,
                                          visualDensity: VisualDensity.compact,
                                          value: 0,
                                          groupValue: selectedOption,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selectedOption = value;
                                            });print('Selected Option : $selectedOption');
                                          },
                                        ),
                                        Text(
                                          'All Products',
                                          style: xlTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Radio<int>( activeColor: blackColor,
                                          materialTapTargetSize:
                                          MaterialTapTargetSize
                                              .shrinkWrap,
                                          visualDensity: VisualDensity.compact,
                                          value: 1,
                                          groupValue: selectedOption,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selectedOption = value;
                                            });print('Selected Option : $selectedOption');
                                          },
                                        ),
                                        Text(
                                          'One Product Category',
                                          style: xlTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Radio<int>( activeColor: blackColor,
                                          materialTapTargetSize:
                                          MaterialTapTargetSize
                                              .shrinkWrap,
                                          visualDensity: VisualDensity.compact,
                                          value: 2,
                                          groupValue: selectedOption,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selectedOption = value;
                                            });
                                            print('Selected Option : $selectedOption');
                                          },
                                        ),
                                        Text(
                                          'One Product',
                                          style: xlTextStyle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                selectedOption == 1
                    ?CustomDropDownWithoutTitle(dropDownItems: _dropdownItems, onChanged: (String? newValue) {
                  setState(() {
                    _selectedProduct = newValue;
                  });

                }, value: _selectedProduct, title: 'Readymade')
                //
                    : selectedOption == 2
                    ? CustomDropDownWithoutTitle(dropDownItems: _dropdownItems, onChanged: (String? newValue) {
                  setState(() {
                    _selectedProduct = newValue;
                  });

                }, value: _selectedProduct, title: 'Select Product')
                    : SizedBox(),
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
                    width: AppScreenUtil().screenWidth(475),
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
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
                                ? Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(85),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(uomList[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis),
                                ],
                              ),
                            )
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                  AppScreenUtil().screenWidth(95),
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
                            child: tappedLocation == false
                                ? Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(locationList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ))
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                  AppScreenUtil().screenWidth(95),
                                  child: editableTextField(
                                      setState, referenceController),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                tappedLocation = true;
                              });
                              print(
                                  'tapped Item to Edit: ${tappedLocation}');
                            },
                          ),
                          InkWell(
                            child: tappeOnHandQty == false
                                ? Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(onHandQtyList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ))
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                  AppScreenUtil().screenWidth(95),
                                  child: editableTextField(
                                      setState, referenceController),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                tappeOnHandQty = true;
                              });
                              print('tapped Item to Edit: $tappeOnHandQty');
                            },
                          ),
                          InkWell(
                            child: tappedRealQty == false
                                ? Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(realQtyList[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ))
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                  AppScreenUtil().screenWidth(95),
                                  child: editableTextField(
                                      setState, referenceController),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                tappedRealQty = true;
                              });
                              print('tapped Item to Edit: $tappedRealQty');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                );
              }),
              tableRowWidth: 475,
              titleWidgets: [
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Product',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                        'UOM',
                        style:
                        placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                        'Location',
                        style:
                        placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                        'On Hand Qty',
                        style:
                        placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                          'Real Qty',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(15),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
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
                      underline:
                      SizedBox(), // Removes the default underline
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
        )
      ],
    );
  }
}
