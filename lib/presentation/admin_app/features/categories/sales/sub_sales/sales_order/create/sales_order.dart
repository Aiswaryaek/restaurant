// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/editableTable.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({super.key});

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];

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

  String? tableSelected;
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  final contactPersonController = TextEditingController();
  final deliveryAddressController = TextEditingController();
  final paymentTermsController = TextEditingController();
  final List<String> tableDropDown = ['Asset', ' Assets'];
  bool tappedProducts = false;
  String? selected;
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final option = <ProductCategoriesModel>[];
  int? tappedType = 0;
  dynamic currentTab = 'Invoice Lines';
  List<String> productsList = [
    'Current Asset',
  ];
  List<String> description = [
    '4',
  ];
  List<String> qty = [
    '10',
  ];
  List<String> unitPrice = [
    '8',
  ];
  List<String> discount = [
    '5%',
  ];
  List<String> amount = [
    '700',
  ];

  @override
  void initState() {
    dateinput.text = "";
    option.add(ProductCategoriesModel('Invoice Lines',''));
    option.add(ProductCategoriesModel('Other Info',''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 25),
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
                          title: 'Customer',
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
                          title: 'Branch',
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
                          title: 'Order Date',
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
                  height: AppScreenUtil().screenHeight(15),
                ),
                Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Divider(
                  color: confirmColor,
                  thickness: 1.3,
                ),
                Transform.translate(
                  offset: Offset(0, -7.5),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children:
                    List<Widget>.generate(option.length, (int index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              tappedType = index;
                              currentTab = option[index].text;
                            });
                            print('current Tab :$currentTab');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                color: tappedType == index
                                    ? branchTransferCreateColor
                                    : whiteColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                option[index].text,
                                style: tableSubTitleLabelStyle,
                              ),
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ],
            )),
        currentTab == 'Invoice Lines'?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets: List.generate(amount.length, (index) {
                    return Container(
                      height: AppScreenUtil().screenHeight(37),
                      width: AppScreenUtil().screenWidth(800),
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
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: DropdownButton<String>(
                                        dropdownColor: whiteColor,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        value: tableSelected,
                                        items: tableDropDown.map((String item) {
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
                                            tableSelected = newValue;
                                            tappedProducts = true;
                                          });

                                          ///
                                          // Print or use the selected item
                                          print(
                                              'Selected item: $tableSelected');
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: subTextInventoryColor,
                                        ),
                                        iconSize: 20,
                                        hint: Text(
                                          '',
                                          style: cartItemTitleStyle,
                                        ),
                                        isExpanded: false,
                                        underline:
                                        SizedBox(), // Removes the default underline
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(85),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      tappedProducts == true
                                          ? description[index]
                                          : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    tappedProducts == true
                                        ? Expanded(
                                      child: DropdownButton<String>(
                                        dropdownColor: whiteColor,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        value: tableSelected,
                                        items: tableDropDown
                                            .map((String item) {
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
                                            tableSelected = newValue;
                                            tappedProducts = true;
                                          });

                                          ///
                                          // Print or use the selected item
                                          print(
                                              'Selected item: $tableSelected');
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: subTextInventoryColor,
                                        ),
                                        iconSize: 20,
                                        hint: Text(
                                          '',
                                          style: cartItemTitleStyle,
                                        ),
                                        isExpanded: false,
                                        underline:
                                        SizedBox(), // Removes the default underline
                                      ),
                                    )
                                        : SizedBox()
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(tappedProducts == true ? qty[index] : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
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
                                      tappedProducts == true
                                          ? unitPrice[index]
                                          : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
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
                                      tappedProducts == true
                                          ? discount[index]
                                          : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  tappedProducts == true
                                      ? Expanded(
                                    child: DropdownButton<String>(
                                      dropdownColor: whiteColor,
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10),
                                      value: tableSelected,
                                      items: tableDropDown
                                          .map((String item) {
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
                                          tableSelected = newValue;
                                          tappedProducts = true;
                                        });

                                        ///
                                        // Print or use the selected item
                                        print(
                                            'Selected item: $tableSelected');
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: subTextInventoryColor,
                                      ),
                                      iconSize: 20,
                                      hint: Text(
                                        '',
                                        style: cartItemTitleStyle,
                                      ),
                                      isExpanded: false,
                                      underline:
                                      SizedBox(), // Removes the default underline
                                    ),
                                  )
                                      : SizedBox()
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
                                      tappedProducts == true
                                          ? amount[index]
                                          : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  tableRowWidth: 800,
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
                            'Description',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                              'UOM',
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
                              'Qty',
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
                              'Unit Price',
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
                              'Discount',
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
                              'Tax',
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
                              'Amount',
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

                            ///
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
        ):Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: contactPersonController,
                          title: 'Contact Person')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: deliveryAddressController,
                          title: 'Delivery Address'))
                ],
              ),
              SizedBox(height: AppScreenUtil().screenHeight(14),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: paymentTermsController,
                          title: 'Payment Terms')
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child:
                      Container()
                  )
                ],
              ),
              SizedBox(height: AppScreenUtil().screenHeight(30),),
            ],
          ),
        ),
      ],
    );
  }
}
