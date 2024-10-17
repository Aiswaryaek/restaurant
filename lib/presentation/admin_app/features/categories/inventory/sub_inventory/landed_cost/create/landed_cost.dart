// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/editableTable.dart';

class LandedCost extends StatefulWidget {
  const LandedCost({super.key});

  @override
  State<LandedCost> createState() => _LandedCostState();
}

class _LandedCostState extends State<LandedCost> {
  String? _selectedItem;
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  final journalController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedHandQty = false;
  dynamic tappedTransferQty = false;
  int? tappedType = 0;
  dynamic currentTab = 'Extra Charge';
  final option = <ProductCategoriesModel>[];
  List<String> costline = [
    'Loading & Unloading Charges',
  ];
  List<String> product = [
    'Product A',
  ];
  List<String> quantity = [
    '5',
  ];
  List<String> originalValue = [
    '500',
  ];
  List<String> newValue = [
    '600',
  ];
  List<String> products = [
    'Loading & Unloading Charge',
  ];
  List<String> description = [
    'Charges',
  ];
  List<String> account = [
    'Inventory valuation Account',
  ];
  List<String> cost = [
    '500',
  ];
  List<String> additionalLandedCost = [
    '100',
  ];

  //expense table
  List<String> expenseProduct = [
    'Loading & Unloading Charges',
  ];
  List<String> expenseDescription = [
    'Charges',
  ];
  List<String> expenseAccount = [
    'Inventory Valuation Account',
  ];
  List<String> ExpenseCost = [
    '500',
  ];
  int _selectedRadio = 0;
  final transferQty = TextEditingController();
  String? tableSelected;
  final List<String> tableDropDown = ['Asset', ' Assets'];

  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
    print('Tapped radio: $_selectedRadio');
  }

  @override
  void initState() {
    dateinput.text = "";
    option.add(ProductCategoriesModel('Extra Charge',''));
    option.add(ProductCategoriesModel('Valuation',''));
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
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
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Branch',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CustomTextFieldWithDate(
                          controller: dateinput,
                          title: 'Date',
                          onTap: () async {
                            dateSelection(controller: dateinput);
                          },
                        )
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
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Vendor',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'GRN',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(offset: Offset(0,8),child: Text(
                            'Apply On',
                            style: bookedTextStyle,
                          ),),
                          Transform.translate(offset: Offset(0,10),child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
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
                                    'Inventory',
                                    style: bookedTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
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
                                    'Expense',
                                    style: bookedTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CustomTextFieldWithTitle(
                            controller: journalController,
                            title: 'Journal')
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                const Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                const Divider(
                  color: confirmColor,
                  thickness: 1.3,
                ),
                Transform.translate(
                  offset: const Offset(0, -7.5),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children:
                    List<Widget>.generate(_selectedRadio==0?option.length:1, (int index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              tappedType = index;
                              currentTab = option[index].text;
                            });
                            print('current Tab :$currentTab');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding:
                              const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                color: tappedType == index
                                    ? branchTransferCreateColor
                                    : whiteColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                _selectedRadio==0?option[index].text:'Extra Charge',
                                style: tableSubTitleLabelStyle,
                              ),
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ],
            )),
        currentTab == 'Extra Charge'
            ? _selectedRadio==0?Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(products.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(37),
                        width: AppScreenUtil().screenWidth(653),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: inventorySelectionColor),
                          color: whiteColor,
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
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(97),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: DropdownButton<String>(
                                          dropdownColor: whiteColor,
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10,
                                              right: 10),
                                          value: tableSelected,
                                          items: tableDropDown
                                              .map((String item) {
                                            return DropdownMenuItem<
                                                String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style:
                                                subTitleTextStyle,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged:
                                              (String? newValue) {
                                            // Update the selected item
                                            setState(() {
                                              tableSelected =
                                                  newValue;
                                              tappedProducts = true;
                                            });

                                            ///
                                            // Print or use the selected item
                                            print(
                                                'Selected item: $tableSelected');
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color:
                                            subTextInventoryColor,
                                          ),
                                          iconSize: 20,
                                          hint: Text(
                                            '',
                                            style: cartItemTitleStyle,
                                          ),
                                          isExpanded: true,
                                          underline:
                                          const SizedBox(), // Removes the default underline
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? description[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(160),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? account[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? cost[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 653,
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
                      width: AppScreenUtil().screenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Description',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(160),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                            'Cost',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10),
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
                          icon: const Icon(
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
                          const SizedBox(), // Removes the default underline
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(10),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      6,
                      6,
                      6,
                      6,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: inventorySelectionColor),
                    child: const Icon(
                      Icons.add,
                      color: redColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ):Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(products.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(37),
                        width: AppScreenUtil().screenWidth(653),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: inventorySelectionColor),
                          color: whiteColor,
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
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(97),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: DropdownButton<String>(
                                          dropdownColor: whiteColor,
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10,
                                              right: 10),
                                          value: tableSelected,
                                          items: tableDropDown
                                              .map((String item) {
                                            return DropdownMenuItem<
                                                String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style:
                                                subTitleTextStyle,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged:
                                              (String? newValue) {
                                            // Update the selected item
                                            setState(() {
                                              tableSelected =
                                                  newValue;
                                              tappedProducts = true;
                                            });

                                            ///
                                            // Print or use the selected item
                                            print(
                                                'Selected item: $tableSelected');
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color:
                                            subTextInventoryColor,
                                          ),
                                          iconSize: 20,
                                          hint: Text(
                                            '',
                                            style: cartItemTitleStyle,
                                          ),
                                          isExpanded: true,
                                          underline:
                                          const SizedBox(), // Removes the default underline
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? description[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(160),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? account[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? cost[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 653,
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
                      width: AppScreenUtil().screenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Description',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(160),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Account',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                            'Cost',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10),
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
                          icon: const Icon(
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
                          const SizedBox(), // Removes the default underline
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(10),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      6,
                      6,
                      6,
                      6,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: inventorySelectionColor),
                    child: const Icon(
                      Icons.add,
                      color: redColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
            : Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(costline.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(37),
                        width: AppScreenUtil().screenWidth(655),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: inventorySelectionColor),
                          color: whiteColor,
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
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(97),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: DropdownButton<String>(
                                          dropdownColor: whiteColor,
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10,
                                              right: 10),
                                          value: tableSelected,
                                          items: tableDropDown
                                              .map((String item) {
                                            return DropdownMenuItem<
                                                String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style:
                                                subTitleTextStyle,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged:
                                              (String? newValue) {
                                            // Update the selected item
                                            setState(() {
                                              tableSelected =
                                                  newValue;
                                              tappedProducts = true;
                                            });

                                            ///
                                            // Print or use the selected item
                                            print(
                                                'Selected item: $tableSelected');
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color:
                                            subTextInventoryColor,
                                          ),
                                          iconSize: 20,
                                          hint: Text(
                                            '',
                                            style: cartItemTitleStyle,
                                          ),
                                          isExpanded: true,
                                          underline:
                                          const SizedBox(), // Removes the default underline
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? product[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? quantity[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? originalValue[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(97),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? newValue[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(131),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? additionalLandedCost[
                                        index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 655,
                  titleWidgets: [
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(97),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cost Line',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(97),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Product',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(97),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Quantity',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(97),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Original Value',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(97),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New Value',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(131),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Additional Landed Cost',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10),
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
                          icon: const Icon(
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
                          const SizedBox(), // Removes the default underline
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(10),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      6,
                      6,
                      6,
                      6,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: inventorySelectionColor),
                    child: const Icon(
                      Icons.add,
                      color: redColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
