// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../models/inventory_product_category_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
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

  @override
  void initState() {
    item.add(InventoryProductModel('General Info'));
    item.add(InventoryProductModel('Accounting'));
    item.add(InventoryProductModel('Inventory'));
    // item.add(InventoryProductModel('Other Info'));
    item.add(InventoryProductModel('Image Upload'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 8,
          children: List<Widget>.generate(item.length, (int index) {
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
                            ? inventorySelectionColor:searchTextColor,
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
          height: AppScreenUtil().screenHeight(15),
        ),
        currentTab == 'General Info'
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CommonDropDownWithTitle(
                        dropDownItems: _dropdownItems,
                        title: 'Product Type',
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                      )),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: barcodeController,
                              title: 'Barcode'))
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
                              controller: brandController,
                              title: 'Brand')),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: releaseDateController,
                              title: 'Release Date'))
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
                        title: 'UOM',
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
                        title: 'Purchase UOM',
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
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: costController,
                              title: 'Cost')),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: TextEditingController(),
                              title: 'Sales Price'))
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
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: hsnCodeController,
                              title: 'HSN Code'))
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

                                    print('Checkbox value: $_isChecked');
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    width: AppScreenUtil().screenWidth(25)),
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
                : currentTab == 'Inventory'
                    ? Row(
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
                          SizedBox(width: AppScreenUtil().screenWidth(25)),
                          Expanded(
                              child: CustomTextFieldWithTitle(
                                  controller:reOrderQuantity ,
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
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Image Upload',
                                style: bookedTextStyle,
                              ),
                              SvgPicture.asset(
                                ImageCons.uploadImage,
                                height: 70,
                                width: 100,
                              ),
                            ],
                          )
      ],
    );
  }
}
