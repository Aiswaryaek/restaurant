// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class PreparationDetail extends StatefulWidget {
  const PreparationDetail({super.key});

  @override
  State<PreparationDetail> createState() => _PreparationDetailState();
}

class _PreparationDetailState extends State<PreparationDetail> {
  final List<String> _dropdownItems = ['Product 1', 'Product 2', 'Product 3'];
  String? _selectedItem;
  FocusNode focusNode = FocusNode();
  final qtyController = TextEditingController();
  final orderDateController = TextEditingController();
  final productionDateController = TextEditingController();
  ScrollController preparationTableController = ScrollController();
  List<String> quality = [
    '10',
    '2',
  ];
  List<String> unit = [
    'Kg',
    'Units',
  ];

  @override
  void initState() {
    focusNode.addListener(() {
      print('1: ${focusNode.hasFocus}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 30),
        decoration: BoxDecoration(
          color: shiftContainerColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(13),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MO0000006',
                  style: pangramMedium(size: 9.0, color: blackColor),
                ),
                Text(
                  'Cost Analysis',
                  style: pangramRegular(size: 9.0, color: confirmColor),
                )
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Product',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
              height: AppScreenUtil().screenHeight(41),
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: adminDashBoardDateDropDownContainerBoxShadowColor,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                ),
              ], color: whiteColor),
              child: DropdownButton<String>(
                style: searchInputTextStyle,
                padding: const EdgeInsets.only(left: 10, right: 10),
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: pangramMedium(
                          size: 9.0, color: blackColor.withOpacity(0.5)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: blackColor.withOpacity(0.5),
                ),
                iconSize: 20,
                isExpanded: true,
                underline: const SizedBox(), // Removes the default underline
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Qty',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex:5,child: Container(
                    height: AppScreenUtil().screenHeight(41),
                    width: double.infinity,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                        color: adminDashBoardDateDropDownContainerBoxShadowColor,
                        offset: Offset(0, 0),
                        blurRadius: 6,
                      ),
                    ], color: whiteColor),
                    child: TextFormField(
                      controller: qtyController,maxLines: 10,
                      style: searchInputTextStyle,
                      cursorColor: whiteColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        hintStyle: placeholderTextStyle,
                        fillColor: blackColor,
                        enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    )),),
               Expanded(flex:1,child:  Container(
                 height: AppScreenUtil().screenHeight(41),
                 width: double.infinity,
                 decoration: BoxDecoration(boxShadow: const [
                   BoxShadow(
                     color: adminDashBoardDateDropDownContainerBoxShadowColor,
                     offset: Offset(0, 0),
                     blurRadius: 6,
                   ),
                 ], color: unitsBackgroundColor.withOpacity(0.5)),
                 child: Center(
                   child: Text('Units',style: pangramMedium(size: 9.0,color: blackColor),),
                 ),
               )),
              ],
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Receipt',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
              height: AppScreenUtil().screenHeight(41),
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: adminDashBoardDateDropDownContainerBoxShadowColor,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                ),
              ], color: whiteColor),
              child: DropdownButton<String>(
                style: searchInputTextStyle,
                padding: const EdgeInsets.only(left: 10, right: 10),
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: pangramMedium(
                          size: 9.0, color: blackColor.withOpacity(0.5)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: blackColor.withOpacity(0.5),
                ),
                iconSize: 20,
                isExpanded: true,
                underline: const SizedBox(), // Removes the default underline
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Order Date',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
                height: AppScreenUtil().screenHeight(41),
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: adminDashBoardDateDropDownContainerBoxShadowColor,
                    offset: Offset(0, 0),
                    blurRadius: 6,
                  ),
                ], color: whiteColor),
                child: TextFormField(
                  controller: orderDateController,maxLines: 10,
                  style: searchInputTextStyle,
                  cursorColor: whiteColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintStyle: placeholderTextStyle,
                    fillColor: blackColor,
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                  ),
                )),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Production Date',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
                height: AppScreenUtil().screenHeight(41),
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: adminDashBoardDateDropDownContainerBoxShadowColor,
                    offset: Offset(0, 0),
                    blurRadius: 6,
                  ),
                ], color: whiteColor),
                child: TextFormField(
                  controller: productionDateController,maxLines: 10,
                  style: searchInputTextStyle,
                  cursorColor: whiteColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    hintStyle: placeholderTextStyle,
                    fillColor: blackColor,
                    enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: whiteColor),
                    ),
                  ),
                )),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Branch',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
              height: AppScreenUtil().screenHeight(41),
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: adminDashBoardDateDropDownContainerBoxShadowColor,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                ),
              ], color: whiteColor),
              child: DropdownButton<String>(
                style: searchInputTextStyle,
                padding: const EdgeInsets.only(left: 10, right: 10),
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: pangramMedium(
                          size: 9.0, color: blackColor.withOpacity(0.5)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: blackColor.withOpacity(0.5),
                ),
                iconSize: 20,
                isExpanded: true,
                underline: const SizedBox(), // Removes the default underline
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Text(
              'Location',
              style: customerLabelStyle,
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Container(
              height: AppScreenUtil().screenHeight(41),
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: adminDashBoardDateDropDownContainerBoxShadowColor,
                  offset: Offset(0, 0),
                  blurRadius: 6,
                ),
              ], color: whiteColor),
              child: DropdownButton<String>(
                style: searchInputTextStyle,
                padding: const EdgeInsets.only(left: 10, right: 10),
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: pangramMedium(
                          size: 9.0, color: blackColor.withOpacity(0.5)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: blackColor.withOpacity(0.5),
                ),
                iconSize: 20,
                isExpanded: true,
                underline: const SizedBox(), // Removes the default underline
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(25),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 1.5),
              height: AppScreenUtil().screenHeight(16),
              width: AppScreenUtil().screenWidth(58),
color: componentsBackgroundColor,
              child: Center(
                child: Text('Components',style: pangramMedium(size: 8.0,color: whiteColor),),
              ),
            ),
            SizedBox(height: AppScreenUtil().screenHeight(5),),
            SingleChildScrollView(
              physics:ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: preparationTableController,
              child: Padding(
                padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(16)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Table heading
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(30)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(28),
                        width: AppScreenUtil().screenWidth(300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: confirmColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Text(
                                      'Product',
                                      style: pangramMedium(size: 9.0, color: whiteColor),
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        'Quality',
                                        style: pangramMedium(size: 9.0, color: whiteColor),
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child:  Text(
                                        'Unit',
                                        style: pangramMedium(size: 9.0, color: whiteColor),
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Column(children: List.generate(quality.length, (index) {
                      return InkWell(
                        child: Padding(padding: EdgeInsets.only(bottom: 15),child: Container(
                          height: AppScreenUtil().screenHeight(26),
                          width: AppScreenUtil().screenWidth(300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: whiteColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(10)),

                            ///scrolling row
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(95),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          style: searchInputTextStyle,
                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                          value:_selectedItem,
                                          items: _dropdownItems.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: pangramMedium(size: 9.0, color: blackColor),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedItem = newValue;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: blackColor,
                                          ),
                                          iconSize: 22,
                                          isExpanded: true,
                                          underline:
                                          const SizedBox(), // Removes the default underline
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(quality[index],
                                            style: pangramMedium(size: 9.0, color: blackColor),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(90),
                                      child: Center(
                                        child: Text(
                                          unit[index],
                                          style: pangramMedium(size: 9.0, color: blackColor),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),),
                        onTap: () {
                          bottomBar(context);
                        },
                      );
                    })),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppScreenUtil().screenHeight(15),),
            Text('Add Line',style: takeAwayTextStyle,)
          ],
        ),
      ),
    );
  }
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgDisabledView,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.imgDisabledEdit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
