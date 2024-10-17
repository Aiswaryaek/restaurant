// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_date.dart';

import '../../../../../../../../models/product_categories_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../../widgets/editableTable.dart';

class RequestForQuotation extends StatefulWidget {
  const RequestForQuotation({super.key});

  @override
  State<RequestForQuotation> createState() => _RequestForQuotationState();
}

class _RequestForQuotationState extends State<RequestForQuotation> {
  String? _selectedItem;
  String? selected;
  final List<String> _dropdownItems = ['01', '02', '03'];
  final List<String> dropdownItems = ['Add Line', 'Add Header'];
  final dateinput = TextEditingController();
  final referenceController = TextEditingController();
  final deliveryTermsController = TextEditingController();
  dynamic tappedProducts = false;
  dynamic tappedUom = false;
  dynamic tappedHandQty = false;
  dynamic tappedTransferQty = false;
  int? tappedType = 0;
  dynamic currentTab = 'Invoice Lines';
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
    return Column(
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
                      child: Row(
                        children: [
                          Text(
                            'RFQ  ',
                            style: rfqTextStyle,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '/PO3542',
                            style: rfqSubTextStyle,
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
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
                          title: 'Branch',
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
                          title: 'Qoutation Date',
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
                          title: 'Currency',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment terms',
                              style: bookedTextStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(8),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteColor,
                                  boxShadow:const [
                                    BoxShadow(
                                      color: searchTextColor,
                                      offset: Offset(0, 0),
                                      blurRadius: 1,
                                    ),
                                  ]),
                              child: SizedBox(
                                height: 38,
                                child: DropdownButton<String>(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  value: _selectedItem,
                                  items: _dropdownItems.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: subTitleTextStyle,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedItem = newValue;
                                    });
                                  },
                                  icon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                     InkWell(
                                       onTap: (){
                                         setState(() {
                                           print('TApped');
                                         });
                                       },
                                       child:  Container(
                                         height: AppScreenUtil().screenHeight(16.3),
                                         width: AppScreenUtil().screenWidth(18.12),
                                         decoration: BoxDecoration(color: specialItemsLeftMenuColor,borderRadius: BorderRadius.circular(4)),
                                         child: Center(
                                           child: Icon(Icons.add,color: whiteColor,size: 13,),
                                         ),
                                       ),
                                     ),
                                      SizedBox(width:AppScreenUtil().screenWidth(3),),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: blackColor,
                                      ),
                                    ],
                                  ),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline:
                                  const SizedBox(), // Removes the default underline
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'LPO No.',
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
                          title: 'Expiry Date',
                          onTap: () async {
                            dateSelection(controller: dateinput);
                          },
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        Container()
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
        currentTab == 'Invoice Lines'
            ? Column(
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
            : Padding(padding: EdgeInsets.fromLTRB(16,0,40,20),child: CustomTextFieldWithTitle(textFieldSize: 85,
            controller: deliveryTermsController,
            title: 'Delivery Terms')),
        SizedBox(height: AppScreenUtil().screenHeight(20),)
      ],
    );
  }
}
