// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/models/inventory_product_category_model.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/presentation/user_app/widgets/default_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class PosProducts extends StatefulWidget {
  const PosProducts({super.key});

  @override
  State<PosProducts> createState() => _PosProductsState();
}

class _PosProductsState extends State<PosProducts> {
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();
  final mainCategoryController = TextEditingController();
  final posCategoryController = TextEditingController();
  final brandController = TextEditingController();
  final barcodeController = TextEditingController();
  final releaseDateController = TextEditingController();
  final costController = TextEditingController();
  final salesController = TextEditingController();
  final hsnCodeController = TextEditingController();
  final reOrderQuantity = TextEditingController();
  final item = <InventoryProductModel>[];
  dynamic currentTab = 'General Info';
  int? tappedProduct = 0;
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  bool _isChecked = false;
  int _selectedRadio = 0;
  String selectedRadio = 'Stocks';
  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });

    if (_selectedRadio == 0) {
      selectedRadio = 'Stocks';
    } else if (_selectedRadio == 1) {
      selectedRadio = 'Service';
    }
  }

  void dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Format the date to dd/MM/yyyy
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

      setState(() {
        // Update the controller text with formatted date
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
    item.add(InventoryProductModel('General Info'));
    item.add(InventoryProductModel('Accounting'));
    item.add(InventoryProductModel('Inventory'));
    // item.add(InventoryProductModel('Other Info'));
    // item.add(InventoryProductModel('Image Upload'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Product',
                  style: pangramMedium(size: 14.0, color: blackColor),
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Name',
                              style: bookedTextStyle,
                            ),
                            Text(
                              'PRD22',
                              style: bookedTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(8),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                color:
                                    adminDashBoardDateDropDownContainerBoxShadowColor,
                                offset: Offset(0, 0),
                                blurRadius: 2.2,
                              ),
                            ],
                          ),
                          child: SizedBox(
                              height: 37,
                              child: defaultTextField(
                                  setState, productNameController)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'Image upload',
                        style: dashBoardTextStyle,
                      ),
                      SvgPicture.asset(
                        ImageCons.uploadImage,
                        height: 70,
                        width: 100,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextFieldWithTitle(
                          controller: TextEditingController(),
                          title: 'Native Name')),
                  SizedBox(width: AppScreenUtil().screenWidth(25)),
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'Main Category',
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
                height: AppScreenUtil().screenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CommonDropDownWithTitle(
                    dropDownItems: _dropdownItems,
                    title: 'POS Category',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  )),
                  SizedBox(width: AppScreenUtil().screenWidth(15)),
                  Expanded(
                      child: Transform.translate(
                    offset: Offset(-7, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              value: 0,
                              activeColor: blackColor,
                              focusColor: blackColor,
                              groupValue: _selectedRadio,
                              onChanged: _handleRadioValueChange,
                            ),
                            Text(
                              'Stocks',
                              style: bookedTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Radio(
                              activeColor: blackColor,
                              focusColor: blackColor,
                              value: 1,
                              groupValue: _selectedRadio,
                              onChanged: _handleRadioValueChange,
                            ),
                            Text(
                              'Service',
                              style: bookedTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(5),
              ),
              const Divider(
                color: inventorySelectionColor,
                thickness: 1.5,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 8,
                    children: List<Widget>.generate( selectedRadio == 'Service' ? 2 : item.length, (int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            tappedProduct = index;
                            currentTab = item[index].text;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(17, 3, 18, 4),
                            decoration: BoxDecoration(
                              color: tappedProduct == index
                                  ? inventorySelectionColor
                                  : whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: tappedProduct == index
                                      ? inventorySelectionColor
                                      : searchTextColor,
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              item[index].text,
                              style: holdAndClearButtonLabelStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(18),
                  ),
                  currentTab == 'General Info'
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CustomTextFieldWithTitle(
                                        controller: barcodeController,
                                        title: 'Barcode')),
                                SizedBox(
                                    width: AppScreenUtil().screenWidth(25)),
                                Expanded(
                                    child: CommonDropDownWithTitle(
                                  dropDownItems: _dropdownItems,
                                  title: 'UOM',
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
                              height: AppScreenUtil().screenHeight(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CommonDropDownWithTitle(
                                  dropDownItems: _dropdownItems,
                                  title: 'Purchase UOM',
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
                                    child: CustomTextFieldWithTitle(
                                        controller: costController,
                                        title: 'Cost')),
                              ],
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CustomTextFieldWithTitle(
                                        controller: salesController,
                                        title: 'Sales Price')),
                                SizedBox(
                                    width: AppScreenUtil().screenWidth(25)),
                                Expanded(
                                    child: CommonDropDownWithTitle(
                                  dropDownItems: _dropdownItems,
                                  title: 'HSN Code',
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
                              height: AppScreenUtil().screenHeight(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CommonDropDownWithTitle(
                                  dropDownItems: _dropdownItems,
                                  title: 'HS Code',
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
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Release Date',
                                      style: bookedTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(8),
                                    ),
                                    Container(
                                      // width: widget.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: whiteColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: searchTextColor,
                                              offset: Offset(0, 0),
                                              blurRadius: 1.5,
                                            ),
                                          ]),
                                      child: SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(31),
                                          child: TextFormField(
                                            onTap: () {
                                              dateSelection(
                                                  controller:
                                                      releaseDateController);
                                            },
                                            readOnly: true,
                                            controller: releaseDateController,
                                            maxLines: 10,
                                            style: subTitleTextStyle,
                                            cursorColor: whiteColor,
                                            decoration: InputDecoration(
                                              suffixIcon: Container(
                                                  width: AppScreenUtil()
                                                      .screenWidth(8),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12, bottom: 12),
                                                  child: GestureDetector(
                                                    // onTap: widget.onTap,
                                                    child: SvgPicture.asset(
                                                      ImageCons.calender,
                                                      height: 13,
                                                      color: searchTextColor,
                                                    ),
                                                  )),
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                              isDense: true,
                                              hintStyle: placeholderTextStyle,
                                              fillColor: blackColor,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: whiteColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: whiteColor),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: whiteColor),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: whiteColor),
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ],
                        )
                      : currentTab == 'Accounting'
                          ? Column(
                              children: [
                                Transform.translate(
                                  offset: Offset(-12, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Checkbox(
                                          checkColor: whiteColor,
                                          activeColor: blackColor,
                                          hoverColor: blackColor,
                                          value: _isChecked,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _isChecked = newValue ?? false;
                                            });

                                            print(
                                                'Checkbox value: $_isChecked');
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Non Taxable',
                                        style: subInventoryTextStyle,
                                      )
                                    ],
                                  ),
                                ),
                                _isChecked == false
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: CommonDropDownWithTitle(
                                            dropDownItems: _dropdownItems,
                                            title: 'Vendor Tax',
                                            value: _selectedItem,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _selectedItem = newValue;
                                              });
                                            },
                                          )),
                                          SizedBox(
                                              width: AppScreenUtil()
                                                  .screenWidth(25)),
                                          Expanded(
                                              child: CommonDropDownWithTitle(
                                            dropDownItems: _dropdownItems,
                                            title: 'Customer Tax',
                                            value: _selectedItem,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                _selectedItem = newValue;
                                              });
                                            },
                                          ))
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            )
                          :
                          // currentTab == 'Inventory'
                          //     ?
                          selectedRadio =='Service'?SizedBox():
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CommonDropDownWithTitle(
                                  dropDownItems: _dropdownItems,
                                  title: 'Tracking',
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
                                    child: CustomTextFieldWithTitle(
                                        controller: reOrderQuantity,
                                        title: 'Reorder Quantity'))
                              ],
                            )
                  // : currentTab == 'Other Info'
                  //     ? Column(
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Material Composition',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               )),
                  //               SizedBox(
                  //                   width: AppScreenUtil().screenWidth(25)),
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Product Care',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               ))
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: AppScreenUtil().screenHeight(15),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Pattern',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               )),
                  //               SizedBox(
                  //                   width: AppScreenUtil().screenWidth(25)),
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Material',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               ))
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: AppScreenUtil().screenHeight(15),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Country Of Origin',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               )),
                  //               SizedBox(
                  //                   width: AppScreenUtil().screenWidth(25)),
                  //               Expanded(
                  //                   child: CommonDropDownWithTitle(
                  //                 dropDownItems: _dropdownItems,
                  //                 title: 'Return Policy',
                  //                 value: _selectedItem,
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     _selectedItem = newValue;
                  //                   });
                  //                 },
                  //               ))
                  //             ],
                  //           ),
                  //         ],
                  //       )
                  // : Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Image Upload',
                  //         style: bookedTextStyle,
                  //       ),
                  //       SvgPicture.asset(
                  //         ImageCons.uploadImage,
                  //         height: 70,
                  //         width: 100,
                  //       ),
                  //     ],
                  //   )
                ],
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
