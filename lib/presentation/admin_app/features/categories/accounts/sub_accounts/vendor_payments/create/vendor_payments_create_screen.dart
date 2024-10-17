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

class VendorPaymentsCreate extends StatefulWidget {
  String tappedItem;

  VendorPaymentsCreate(this.tappedItem, {super.key});

  @override
  State<VendorPaymentsCreate> createState() => _VendorPaymentsCreateState();
}

class _VendorPaymentsCreateState extends State<VendorPaymentsCreate> {
  List<Color> alternateColor = [constantWhite, inventorySelectionColor];
  String? _selectedItem;
  String? selected;
  String? tableSelected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> tableDropDown = ['Asset', ' Assets'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final chequeNoController = TextEditingController();
  final amountController = TextEditingController();
  final paymentController = TextEditingController();
  final amountInWordsController = TextEditingController();
  final transferQty = TextEditingController();
  bool tappedProducts = false;

  List<String> account = [
    'Current Asset',
  ];
  List<String> label = [
    'Lorem',
  ];
  List<String> branch = [
    'Cyber',
  ];
  List<String> employee = [
    'Munshid',
  ];
  List<String> amount = [
    '100000',
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

  int? selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Payment number
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PAYMENT/2023/10/0001',
                    style: billTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),

                ///Radio buttons
                Padding(
                  padding: EdgeInsets.only(
                    top: AppScreenUtil().screenHeight(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Other payments radio button
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Transform.translate(
                            offset: Offset(-4.5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<int>(
                                  activeColor: blackColor,
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  value: 0,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                    print(
                                        'Selected Option : $selectedOption');
                                  },
                                ),
                                Text(
                                  'Other Payment',
                                  style: xlTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),

                      /// Customer payment radio button
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Transform.translate(
                            offset: Offset(-4.5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<int>(
                                  activeColor: blackColor,
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  value: 1,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                    print(
                                        'Selected Option : $selectedOption');
                                  },
                                ),
                                Text(
                                  'Vendor Payment',
                                  style: xlTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        selectedOption == 0
            ?

        ///Fields and tables
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CommonDropDownWithTitle(
                            dropDownItems: _dropdownItems,
                            title: 'Payment Type',
                            value: _selectedItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            },
                          )),
                      SizedBox(
                          width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CommonDropDownWithTitle(
                            dropDownItems: _dropdownItems,
                            title: 'Type',
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
                            title: 'Cheque Date',
                            onTap: () async {
                              dateSelection(controller: dateinput);
                            },
                          )),
                      SizedBox(
                          width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: chequeNoController,
                              title: 'Cheque No'))
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
                              controller: amountController,
                              title: 'Amount')),
                      SizedBox(
                          width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithDate(
                            controller: dateinput,
                            title: 'Payment Date',
                            onTap: () async {
                              dateSelection(controller: dateinput);
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
                        child: CustomTextFieldWithTitle(
                            width: AppScreenUtil().screenWidth(153),
                            controller: paymentController,
                            title: 'Payment Reference'),
                      ),
                      SizedBox(
                          width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                        child: CustomTextFieldWithTitle(
                            width: AppScreenUtil().screenWidth(153),
                            controller: amountInWordsController,
                            title: 'Amount In Words'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(15),
                  ),
                  Divider(
                    color: inventorySelectionColor,
                    thickness: 1.5,
                  ),
                ],
              ),
            ),

            ///Tables
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(account.length, (index) {
                    return Container(
                      height: AppScreenUtil().screenHeight(37),
                      width: AppScreenUtil().screenWidth(510),
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
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
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
                                        SizedBox(),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(87),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                      tappedProducts == true
                                          ? label[index]
                                          : '',
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(93),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? branch[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                )),
                            Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(100),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? employee[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                )),
                            Container(
                                color: Colors.transparent,
                                width:
                                AppScreenUtil().screenWidth(95),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? amount[index]
                                            : '',
                                        style:
                                        tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
                  tableRowWidth: 510,
                  titleWidgets: [
                    ///Product
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Account',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    ///Uom
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Label',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    ///On Hand Qty
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Branch',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    ///Transfer Qty
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Employee',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),Container(
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
              padding:
              EdgeInsets.only(left: 16, right: 16, bottom: 20),
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
                          padding:
                          EdgeInsets.only(left: 10, right: 10),
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
        )
            :

        ///Customer payment widgets
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                        dropDownItems: _dropdownItems,
                        title: 'Vendor',
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
                        title: 'Payment Type',
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
                        title: 'Type',
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
                        controller: dateinput,
                        title: 'Cheque Date',
                        onTap: () async {
                          dateSelection(controller: dateinput);
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
                      child: CustomTextFieldWithTitle(
                          controller: chequeNoController,
                          title: 'Cheque No.')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: amountController,
                          title: 'Amount'))
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
                        title: 'Payment Date',
                        onTap: () async {
                          dateSelection(controller: dateinput);
                        },
                      )),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                    child: CustomTextFieldWithTitle(
                        width: AppScreenUtil().screenWidth(153),
                        controller: paymentController,
                        title: 'Payment Reference'),
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
                        width: AppScreenUtil().screenWidth(153),
                        controller: amountInWordsController,
                        title: 'Amount In Words'),
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(

                    ///This container used only for spacing arrangement
                      child: Container(
                        width: AppScreenUtil().screenWidth(153),
                      ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: AppScreenUtil().screenHeight(25)),
                child: Divider(
                  color: inventorySelectionColor,
                  thickness: 1.5,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
