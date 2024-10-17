// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/edit_textfield.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/editableTable.dart';

class InternalTransfer extends StatefulWidget {
  String tappedItem;

  InternalTransfer(this.tappedItem, {super.key});

  @override
  State<InternalTransfer> createState() => _InternalTransferState();
}

class _InternalTransferState extends State<InternalTransfer> {
  List<Color> alternateColor = [constantWhite, inventorySelectionColor];
  String? _selectedItem;
  String? selected;
  String? tableSelected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> tableDropDown = ['Asset', ' Assets'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  final contactPersonController = TextEditingController();
  final transferQty = TextEditingController();
  bool tappedProducts = false;

  List<String> productsList = [
    'Current Asset',
  ];
  List<String> uomList = [
    '4',
  ];
  List<String> onHandQtyList = [
    '10',

  ];
  List<String> transferQtyList = [
    '8',

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
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Warehouse',
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
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Source Location',
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
                          title: 'Destination Location',
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
                        child:
                        CustomTextFieldWithDate(
                          controller: dateinput,
                          title: 'Date',
                          onTap: () async {
                            dateSelection(controller: dateinput);
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CustomTextFieldWithTitle(
                            controller: referenceController,
                            title: 'Reference')
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                CustomTextFieldWithTitle(
                    width: AppScreenUtil().screenWidth(153),
                    controller: contactPersonController,
                    title: 'Contact Person'),
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
                return Container(
                  height: AppScreenUtil().screenHeight(37),
                  width: AppScreenUtil().screenWidth(510),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: DropdownButton<String>(
                                  dropdownColor: whiteColor,
                                  padding: EdgeInsets.only(left: 10, right: 10),
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
                                    print('Selected item: $tableSelected');
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
                                  isExpanded: true,
                                  underline: SizedBox(), // Removes the default underline
                                ),)
                              ],
                            )),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(85),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(tappedProducts==true?uomList[index]:'',
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
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
                                Text(tappedProducts==true?onHandQtyList[index]:'',
                                    style: tableSubTitleLabelStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            )),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(95),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: AppScreenUtil().screenWidth(95),
                                child: editableTextField(
                                    setState, transferQty),
                              ),
                            ],
                          ),)
                      ],
                    ),
                  ),
                );
              }),
              tableRowWidth: 510,
              titleWidgets: [
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Product',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                        style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
                          'Transfer Qty',
                          style: placeOrderingAndConfirmPaymentButtonLabelStyle,
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
        )
      ],
    );
  }
}
