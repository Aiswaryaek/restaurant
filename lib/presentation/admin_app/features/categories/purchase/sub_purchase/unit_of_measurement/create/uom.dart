// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';
import '../../../../../../widgets/uom_table.dart';

class UnitOfMeasurement extends StatefulWidget {
  const UnitOfMeasurement({super.key});

  @override
  State<UnitOfMeasurement> createState() => _UnitOfMeasurementState();
}

class _UnitOfMeasurementState extends State<UnitOfMeasurement> {
  final attributeController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController productTableController = ScrollController();
  double productIndicatorPosition = 0.0;
  String? selected;
  final List<String> dropdownItems = ['Add Line', 'Add Header'];

  List<String> uom = [
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
    'Unit',
  ];
  List<String> type = [
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
    'Smaller Than The Reference Unit Of Measure',
  ];
  List<String> ratio = [
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
  ];
  List<bool> status = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
  ];
  ScrollController uomController = ScrollController();
  double uomControllerposition = 0.0;

  @override
  void initState() {
    uomController.addListener(() {
      setState(() {
        uomControllerposition =
            (uomController.offset / uomController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    uomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.8,
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: CommonDropDownWithTitle(
                                dropDownItems: _dropdownItems,
                                title: 'UOM Category',
                                value: _selectedItem,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedItem = newValue;
                                  });
                                },
                              )),
                              SizedBox(width: AppScreenUtil().screenWidth(25)),
                              Expanded(
                                  child: Container())
                            ],
                          ),

                          SizedBox(
                            height: AppScreenUtil().screenHeight(13),
                          ),
                          Divider(
                            color: inventorySelectionColor,
                            thickness: 1.5,
                          ),
                        ],
                      )),
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenHeight(15),
                            left: AppScreenUtil().screenWidth(16)),
                        child: UOMProductTable(
                            visible: true,
                            scrollController: uomController,
                            slidingIndicatorPosition: uomControllerposition,
                            tableDataWidgets:
                                List.generate(uom.length, (index) {
                              return InkWell(
                                child: Container(
                                  height: AppScreenUtil().screenHeight(37),
                                  width: AppScreenUtil().screenWidth(470),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: blackColor.withOpacity(0.15),
                                            width: 1)),
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
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width:
                                              AppScreenUtil().screenWidth(95),
                                              child: Center(
                                                child:  Text(uom[index],
                                                    style:
                                                    tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: double.infinity,
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(130),
                                              child: Center(
                                                child: Text(type[index],
                                                    style:
                                                        tableSubTitleLabelStyle,maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Colors.transparent,
                                              width:
                                              AppScreenUtil().screenWidth(100),
                                              child: Center(
                                                child:  Text(ratio[index],
                                                    style:
                                                    tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                          width:
                                              AppScreenUtil().screenWidth(100),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlutterSwitch(
                                                width: 43,
                                                height: 18,
                                                toggleSize: 11.0,
                                                value: status[index],
                                                borderRadius: 30.0,
                                                padding: 2.0,
                                                toggleColor:
                                                    status[index] == false
                                                        ? confirmColor
                                                        : greenColor,
                                                switchBorder: Border.all(
                                                  color: status[index] == false
                                                      ? confirmColor
                                                      : greenColor,
                                                  width: 1,
                                                ),
                                                toggleBorder: Border.all(
                                                  color: status[index] == false
                                                      ? confirmColor
                                                      : greenColor,
                                                  width: 1,
                                                ),
                                                activeColor: whiteColor,
                                                inactiveColor: whiteColor,
                                                onToggle: (val) {
                                                  setState(() {
                                                    status[index] = val;
                                                  });
                                                },
                                              ),
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
                            tableRowWidth: 470,
                            titleWidgets: [
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(95),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'UOM',
                                        style:
                                            tableTitleLabelStyleForEmployeeDashBoard,
                                        maxLines: 1,
                                      ),
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(130),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Type',
                                      style:
                                          tableTitleLabelStyleForEmployeeDashBoard,
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
                                      'Ratio',
                                      style:
                                          tableTitleLabelStyleForEmployeeDashBoard,
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
                                        'Status',
                                        style:
                                            tableTitleLabelStyleForEmployeeDashBoard,
                                        maxLines: 1,
                                      ),
                                    ],
                                  )),
                            ]),
                      )),
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
                  ),
                ],
              ),
            ],
          )),
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
                        iconPath: ImageCons.imgVisibility,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
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
