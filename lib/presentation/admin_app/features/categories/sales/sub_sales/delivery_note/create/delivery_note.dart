// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/editableTable.dart';

import '../../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';


class DeliveryNote extends StatefulWidget {
  const DeliveryNote({super.key});

  @override
  State<DeliveryNote> createState() => _DeliveryNoteState();
}

class _DeliveryNoteState extends State<DeliveryNote> {
  String? _selectedItem;
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedHandQty = false;
  dynamic tappedTransferQty = false;
  int? tappedType = 0;
  dynamic currentTab = 'Invoice Lines';
  final option = <ProductCategoriesModel>[];
  List<String> uom = [
    'KG',
  ];
  List<String> product = [
    'Orange',
  ];
  List<String> doneQty = [
    '50',
  ];
  List<String> demandQty = [
    '50',
  ];
  List<String> discount = [
    '10%',
  ];
  List<String> description = [
    'Charges',
  ];
  List<String> account = [
    'Inventory valuation Account',
  ];
  List<String> amount = [
    '100',
  ];
  List<String> tax = [
    '4',
  ];
  int _selectedRadio = 0;
  final transferQty = TextEditingController();
  String? tableSelected;
  final List<String> tableDropDown = ['Asset', ' Assets'];

  void _handleRadioValueChange(dynamic value) {
    setState(() {
      _selectedRadio = value;
    });
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
  void initState() {
    dateinput.text = "";
    option.add(ProductCategoriesModel('Invoice Lines',''));
    option.add(ProductCategoriesModel('Other Info',''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(0, -6),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'DN/2023/12/31',
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
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Customer',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    ///Branch
                    Expanded(
                        child: CustomTextFieldWithTitle(
                            controller: referenceController,
                            title: 'Sales Order')),
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
                    ///Branch
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Location',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
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
                            title: 'Reference')),

                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),

                const Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),

              ],
            )),
        // currentTab == 'Invoice Lines'
        //     ?
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(product.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(37),
                        width: AppScreenUtil().screenWidth(420),
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
                                  AppScreenUtil().screenWidth(95),
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
                                          const SizedBox(),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? uom[index]
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
                                AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? demandQty[index]
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
                                AppScreenUtil().screenWidth(85),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? doneQty[index]
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
                  tableRowWidth: 420,
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
                            'Demand Qty',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                            'Done Qty',
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
        ),

        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
