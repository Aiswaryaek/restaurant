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

class DebitNotes extends StatefulWidget {
  const DebitNotes({super.key});


  @override
  State<DebitNotes> createState() => _DebitNotesState();
}

class _DebitNotesState extends State<DebitNotes> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final branchController = TextEditingController();
  final billReferenceController = TextEditingController();
  final paymentReferenceController = TextEditingController();
  final dateinput = TextEditingController();
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
  final option = <ProductCategoriesModel>[];
  int? tappedType = 0;
  dynamic currentTab = 'Invoice Lines';
  List<String> products = [
    'Orange',
  ];
  List<String> label = [
    'Lorem',
  ];
  List<String> accounts = [
    'Current Asset',
  ];
  List<String> uom = [
    'KG',
  ];
  List<String> qty = [
    '50',
  ];
  List<String> unitPrice = [
    '500',
  ];
  List<String> discount = [
    '10%',
  ];
  List<String> tax1 = [
    '4%',
  ];
  List<String> tax2 = [
    '5%',
  ];
  List<String> amount = [
    '1000',
  ];

  List<String> account = [
    'Current Asset',
    'Current Asset',
    'Current Asset',
  ];

  List<String> partner = [
    'Company',
    'Company',
    'Company',
  ];

  List<String> employee = [
    'Munshid',
    'Munshid',
    'Munshid',
  ];

  List<String> branch = [
    'OOPACKS',
    'OOPACKS',
    'OOPACKS',
  ];

  List<String> debit = [
    '500',
    '500',
    '500',
  ];
  List<String> credit = [
    '1000',
    '1000',
    '1000',
  ];
  String? tableSelected;
  final List<String> tableDropDown = ['Asset', ' Assets'];
  dynamic tappedProducts = false;
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  String? selected;

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
        Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'RBILL/2023/10/0001',
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
                              title: 'Bill',
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
                            CustomTextFieldWithTitle(
                                controller: branchController,
                                title: 'Branch')
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: billReferenceController,
                                title: 'Bil Reference')
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
                              title: 'Bill Date',
                              onTap: () async {
                                dateSelection(controller: dateinput);
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CustomTextFieldWithTitle(
                                controller: paymentReferenceController,
                                title: 'Payment Reference')
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
                              title: 'Accounting Date',
                              onTap: () async {
                                dateSelection(controller: dateinput);
                              },
                            )
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child:
                            CommonDropDownWithTitle(
                              dropDownItems: _dropdownItems,
                              title: 'Journal',
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
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(150),child: CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Currency',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ),),
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
          ],
        ),
        currentTab == 'Invoice Lines'
            ? Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: EditableTable(
                  tableDataWidgets:
                  List.generate(products.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(37),
                        width: AppScreenUtil().screenWidth(908),
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
                                              tableSelected =
                                                  newValue;
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
                                          SizedBox(), // Removes the default underline
                                        ),
                                      )
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
                                            ? label[index]
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
                                AppScreenUtil().screenWidth(100),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        tappedProducts == true
                                            ? accounts[index]
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
                                AppScreenUtil().screenWidth(90),
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
                                  AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          tappedProducts == true
                                              ? qty[index]
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
                                  AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          tappedProducts == true
                                              ? unitPrice[index]
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
                                  AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          tappedProducts == true
                                              ? discount[index]
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
                                  AppScreenUtil().screenWidth(120),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      tappedProducts == true?Container(
                                        padding:
                                        EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        decoration:
                                        BoxDecoration(
                                            border:
                                            Border.all(
                                              color:
                                              blackColor,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                20)),
                                        child: Row(
                                          children: [
                                            Text(
                                              tax1[index],
                                              style:
                                              xlTextStyle,
                                            ),
                                            SizedBox(
                                              width: AppScreenUtil()
                                                  .screenWidth(
                                                  18),
                                            ),
                                            const  Icon(
                                              Icons
                                                  .close_rounded,
                                              size: 11,
                                              color: blackColor,
                                            )
                                          ],
                                        ),
                                      ):SizedBox(),
                                      SizedBox(
                                        width: AppScreenUtil()
                                            .screenWidth(5),
                                      ),
                                      tappedProducts == true?Container(
                                        padding:const
                                        EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        decoration:
                                        BoxDecoration(
                                            border:
                                            Border.all(
                                              color:
                                              blackColor,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                20)),
                                        child: Row(
                                          children: [
                                            Text(
                                              tax2[index],
                                              style:
                                              xlTextStyle,
                                            ),
                                            SizedBox(
                                              width: AppScreenUtil()
                                                  .screenWidth(
                                                  15),
                                            ),
                                            const  Icon(
                                              Icons
                                                  .close_rounded,
                                              size: 11,
                                              color: blackColor,
                                            )
                                          ],
                                        ),
                                      ):SizedBox(),
                                    ],
                                  )
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width:
                                  AppScreenUtil().screenWidth(90),
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
                      ),
                      onTap: () {},
                    );
                  }),
                  tableRowWidth: 908,
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
                            'Label',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
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
                      width: AppScreenUtil().screenWidth(90),
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
                        width: AppScreenUtil().screenWidth(90),
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
                        width: AppScreenUtil().screenWidth(90),
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
                        width: AppScreenUtil().screenWidth(90),
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
                        width: AppScreenUtil().screenWidth(120),
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
                        width: AppScreenUtil().screenWidth(90),
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
              EdgeInsets.only(left: 16, right: 16, bottom: 25),
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
            :Padding(padding: EdgeInsets.fromLTRB(16,0,0,25),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerLeft,
              child: SizedBox(width: AppScreenUtil().screenWidth(150),child: CustomTextFieldWithDate(
                controller: dateinput,
                title: 'Order Date',
                onTap: () async {
                  dateSelection(controller: dateinput);
                },
              )),
            ),
            SizedBox(height: AppScreenUtil().screenHeight(20),),
            EditableTable(
                tableDataWidgets:
                List.generate(account.length, (index) {
                  return InkWell(
                    child: Container(
                      height: AppScreenUtil().screenHeight(37),
                      width: AppScreenUtil().screenWidth(700),
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
                                  Text(
                                      account[index],
                                      style:
                                      tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis),
                                ],
                              ),),
                            Container(
                              color: Colors.transparent,
                              width:
                              AppScreenUtil().screenWidth(95),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                      partner[index],
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
                              AppScreenUtil().screenWidth(100),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                      employee[index],
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
                              AppScreenUtil().screenWidth(90),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                      branch[index],
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
                                AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        debit[index],
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
                                AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        credit[index],
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
                    ),
                    onTap: () {},
                  );
                }),
                tableRowWidth: 700,
                titleWidgets: [
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
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(95),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Partner',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Employee',
                          style:
                          placeOrderingAndConfirmPaymentButtonLabelStyle,
                        ),
                      ],
                    ),
                  ),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Debit',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Credit',
                            style:
                            placeOrderingAndConfirmPaymentButtonLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
          ],
        ),),
        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
