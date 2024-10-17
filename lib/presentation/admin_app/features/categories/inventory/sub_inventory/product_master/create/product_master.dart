// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import '../../../../../../../../models/inventory_product_category_model.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';

class ProductMaster extends StatefulWidget {
  const ProductMaster({super.key});

  @override
  State<ProductMaster> createState() => _ProductMasterState();
}

class _ProductMasterState extends State<ProductMaster> {
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
  final reOrderQuantityController = TextEditingController();
  final attributeController = TextEditingController();
  final options = <InventoryProductModel>[];
  int? tappedProduct = 0;
  dynamic currentTab = 'General Info';
  String? _selectedItem;
  final List<String> _dropdownItems = ['01', '02', '03'];
  bool _isChecked = false;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    whiteColor,
  ];

  @override
  void initState() {
    options.add(InventoryProductModel('General Info'));
    options.add(InventoryProductModel('Accounting'));
    options.add(InventoryProductModel('Inventory'));
    // options.add(InventoryProductModel('Other Info'));
    options.add(InventoryProductModel('Attribute'));
    options.add(InventoryProductModel('Image Upload'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 8,
          children: List<Widget>.generate(options.length, (int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  tappedProduct = index;
                  currentTab = options[index].text;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(17, 2, 18, 4),
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
                    options[index].text,
                    textAlign: TextAlign.center,
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
                        title: 'Barcode',
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
                            controller: brandController, title: 'Brand'),
                      )
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
                        )
                      ),
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
                        )
                      )
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
                            controller: costController, title: 'Cost'),
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                        child: CustomTextFieldWithTitle(
                            controller: salesController, title: 'Sales Price'),
                      )
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
                            controller: hsnCodeController, title: 'HSN Code'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child:  CustomTextFieldWithTitle(
                              controller: releaseDateController, title: 'Release Date'),),
                      SizedBox(width: AppScreenUtil().screenWidth(25)),
                      Expanded(
                        child: Container()
                      )
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
                                controller: reOrderQuantityController,
                                title: 'Reorder Quantity'),
                          )
                        ],
                      )
                    //     : currentTab == 'Other Info'
                    //     ? Column(
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child:
                    //    CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Material Composition',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         ),
                    //         SizedBox(
                    //             width: AppScreenUtil().screenWidth(25)),
                    //         Expanded(
                    //           child:
                    //               CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Product Care',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: AppScreenUtil().screenHeight(15),
                    //     ),
                    //     Row(
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child:
                    //             CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Pattern',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         ),
                    //         SizedBox(
                    //             width: AppScreenUtil().screenWidth(25)),
                    //         Expanded(
                    //           child:
                    //           CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Material',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: AppScreenUtil().screenHeight(15),
                    //     ),
                    //     Row(
                    //       mainAxisAlignment:
                    //       MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child:
                    //          CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Country Of Origin',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         ),
                    //         SizedBox(
                    //             width: AppScreenUtil().screenWidth(25)),
                    //         Expanded(
                    //           child:
                    //             CommonDropDownWithTitle(
                    //               dropDownItems: _dropdownItems,
                    //               title: 'Return Policy',
                    //               value: _selectedItem,
                    //               onChanged: (String? newValue) {
                    //                 setState(() {
                    //                   _selectedItem = newValue;
                    //                 });
                    //               },
                    //             )
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // )
                    : currentTab == 'Attribute'
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextFieldWithTitle(
                                        controller: attributeController,
                                        title: 'Attribute'),
                                  ),
                                  SizedBox(
                                      width: AppScreenUtil().screenWidth(25)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Values',
                                          style: bookedTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(8),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 7),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: whiteColor,
                                            boxShadow: [
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: blackColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'L',
                                                          style: xlTextStyle,
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenWidth(18),
                                                        ),
                                                        const Icon(
                                                          Icons.close_rounded,
                                                          size: 11,
                                                          color: blackColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: AppScreenUtil()
                                                        .screenWidth(5),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 0, 5, 0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: blackColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'XL',
                                                          style: xlTextStyle,
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenWidth(15),
                                                        ),
                                                        const Icon(
                                                          Icons.close_rounded,
                                                          size: 11,
                                                          color: blackColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child:
                                                        DropdownButton<String>(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0,
                                                              right: 5),
                                                      value: _selectedItem,
                                                      items: _dropdownItems
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
                                                          _selectedItem =
                                                              newValue;
                                                        });

                                                        // Print or use the selected item
                                                        print(
                                                            'Selected item: $_selectedItem');
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: blackColor,
                                                      ),
                                                      iconSize: 20,
                                                      isExpanded: false,
                                                      underline:
                                                          SizedBox(), // Removes the default underline
                                                    ),
                                                  )
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(8),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: inventorySelectionColor),
                                  child: Icon(
                                    Icons.add,
                                    color: redColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(10),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppScreenUtil().screenWidth(40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Item Info',
                                      style: tableHeadingLabelStyle,
                                    ),
                                    Text(
                                      'Unit Cost',
                                      style: tableHeadingLabelStyle,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(5),
                              ),
                              Column(
                                  children: List.generate(
                                5,
                                (index) => Container(
                                  height: AppScreenUtil().screenHeight(36),
                                  width: AppScreenUtil().screenWidth(636),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: tableDataAlternateColor[
                                        index % tableDataAlternateColor.length],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(18)),

                                    ///scrolling row
                                    child: Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppScreenUtil()
                                                  .screenWidth(30)),
                                          child: Container(
                                            color: Colors.transparent,
                                            width:
                                                AppScreenUtil().screenWidth(70),
                                            child: Text('Lorem',
                                                style: tableSubTitleLabelStyle,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(
                                            height: 37,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: blackColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'L',
                                                        style: toggleTextStyle,
                                                      ),
                                                      SizedBox(
                                                        width: AppScreenUtil()
                                                            .screenWidth(20),
                                                      ),
                                                      Icon(
                                                        Icons.close_rounded,
                                                        size: 11,
                                                        color: blackColor,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: AppScreenUtil()
                                                      .screenWidth(5),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: blackColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'XL',
                                                        style: toggleTextStyle,
                                                      ),
                                                      SizedBox(
                                                        width: AppScreenUtil()
                                                            .screenWidth(15),
                                                      ),
                                                      Icon(
                                                        Icons.close_rounded,
                                                        size: 11,
                                                        color: blackColor,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          )
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
    ));
  }
}
