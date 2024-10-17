// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unrelated_type_equality_checks, unused_local_variable, curly_braces_in_flow_control_structures, unused_element

import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/controller/table_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_button.dart';
import 'package:restaurant/presentation/user_app/widgets/label_textfield.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';

class SelectTables extends StatefulWidget {
  const SelectTables({super.key});

  @override
  State<SelectTables> createState() => _SelectTablesState();
}

class _SelectTablesState extends State<SelectTables> {
  List<String> floors = ['Ground Floor', 'Second Floor', 'Premium AC'];
  //API
  final tableCtrl = Get.find<TableController>();
  final posCtrl = Get.find<POSController>();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final personController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final totalPersonController = TextEditingController();
  List<TableItem> tables = [];

  List<TableItem> tableList = [];
  List<String> chairsList = [];

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

  List<Color> floorAlternateColor = [
    leftPayslipFirstColor,
    leftPayslipSecondColor,
    userComboItemGridImageColor,
    leftLoanEligibilityEightColor
  ];
  List<Color> floorTransparentColor = [
    leftPayslipFirstColor.withOpacity(0.3),
    leftPayslipSecondColor.withOpacity(0.3),
    userComboItemGridImageColor.withOpacity(0.3),
    leftLoanEligibilityEightColor.withOpacity(0.3)
  ];
  List<String> selectedTableIds = [];
  List<String> selectedChairIds = [];
  int unselectedChairCount = 0;
  bool _isChecked = false;
  dynamic tappedIndex = 0;
  // dynamic selectedTableId;
  DateTime now = DateTime.now();

  @override
  void initState() {
    tableCtrl.getAllFloorDesignsList(
        '${tableCtrl.viewFloorMainList[tappedIndex].id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Floor Id From Initialisation :${tableCtrl.viewFloorMainList[0].id}');
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            print('Hii');
            DateTime now = DateTime.now(); // Get the current date and time
            if (selectedTableIds.isEmpty) {
              AppUtils.oneTimeSnackBar(
                'Please choose any table to add orders',
                bgColor: confirmColor,
              );
            } else if (selectedChairIds.isEmpty) {
              AppUtils.oneTimeSnackBar(
                'Please choose chairs to add orders',
                bgColor: confirmColor,
              );
            } else {
              // Both selectedTableIds and selectedChairIds are not empty
              tableCtrl
                  .posAddOrderFromFloorPlan(
                selectedTableIds,
                selectedChairIds,
                DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
                '${posCtrl.viewCashCustomerResData.id}',
                tableCtrl.viewFloorMainList[tappedIndex].id ?? '',
              )
                  .then((value) {
                if (value == true) {
                  AppUtils.oneTimeSnackBar('Order Added',
                      bgColor: payButtonColor);
                  tableCtrl.isOrderFromFloorPlanIsSuccess = true.obs;
                  posCtrl.productOrderId.value =
                      '${tableCtrl.addPosOrderFromFloorPlanResData.id}';
                  print(
                      'Order Id : ${tableCtrl.addPosOrderFromFloorPlanResData.id}');
                  posCtrl.viewPosOrderByIdRes(
                      tableCtrl.addPosOrderFromFloorPlanResData.id);
                  posCtrl.orderStatus =
                      posCtrl.viewPosOrderByIdResData.status!.obs;
                  tableCtrl.floorPlanOrderId =
                      tableCtrl.addPosOrderFromFloorPlanResData.id!.obs;
                  posCtrl.orderStatus = 'OrderFromTables'.obs;
                }
              });
            }
          },
          backgroundColor: confirmColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Icon(
            Icons.add,
            color: whiteColor,
            size: 20,
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(15, 25, 0, 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Text(
                'Select Table',
                style: mainTextStyle,
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(15),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Floor',
                style: selectFloorTextStyle,
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(5),
            ),
            Obx(
              () => (tableCtrl.viewFloorDetailsLoading.value == true)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: confirmColor,
                        ),
                      ),
                    )
                  : (tableCtrl.isViewFloorListError.value == true)
                      ? Padding(
                          padding: EdgeInsets.only(
                              bottom: AppScreenUtil().screenHeight(30)),
                          child: AppErrorScreen(
                            buttonOnTap: () {
                              tableCtrl.getViewFloorList();
                            },
                          ),
                        )
                      : (tableCtrl.viewFloorMainList.isEmpty)
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              child: const Center(child: EmptyLayout()))
                          : Container(
                              color: whiteColor,
                              height: 34,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: tableCtrl.viewFloorMainList.length,
                                itemBuilder: (context, index) {
                                  tableCtrl.getAllFloorDesignsList(
                                      '${tableCtrl.viewFloorMainList[tappedIndex].id}');
                                  // print('Floor length: ${tableCtrl.viewFloorMainList.length}');
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        tappedIndex = index;
                                        tableCtrl.getAllFloorDesignsList(
                                            '${tableCtrl.viewFloorMainList[tappedIndex].id}');
                                        tables.clear();
                                        selectedChairIds.clear();
                                        selectedTableIds.clear();
                                      });
                                      print('Floor : ${floors[index]}');
                                      print(
                                          'Floor Id From Table List :${tables[tappedIndex].floorId}');
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 4, 5, 4),
                                          width:
                                              AppScreenUtil().screenWidth(164),
                                          height:
                                              AppScreenUtil().screenHeight(34),
                                          decoration: BoxDecoration(
                                              color: tappedIndex == index
                                                  ? floorAlternateColor[index %
                                                      floorAlternateColor
                                                          .length]
                                                  : floorTransparentColor[index %
                                                      floorTransparentColor
                                                          .length],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: tappedIndex == index
                                                      ? floorAlternateColor[
                                                          index %
                                                              floorAlternateColor
                                                                  .length]
                                                      : floorTransparentColor[
                                                          index %
                                                              floorTransparentColor
                                                                  .length])),
                                          child: Center(
                                            child: Text(
                                                '${tableCtrl.viewFloorMainList[index].nameOfFloor}',
                                                style:
                                                    userSelectTableFloorTextStyle,
                                                textAlign: TextAlign.center),
                                          )),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                      width: AppScreenUtil().screenWidth(0));
                                },
                              ),
                            ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(20),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Table',
                style: cartDetailsLabelStyle,
              ),
            ),
            SizedBox(
              height: AppScreenUtil().screenHeight(13),
            ),
            Obx(() => (tableCtrl.isViewFloorDesignLoading.value == true)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: confirmColor,
                      ),
                    ),
                  )
                : Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    runSpacing: 22,
                    children: List<Widget>.generate(
                      tableCtrl.viewFloorDesignResData.floorCanvas!
                          .where((item) => item.type == 'TABLE')
                          .length,
                      (int index) {
                        var tableItem = tableCtrl
                            .viewFloorDesignResData.floorCanvas!
                            .where((item) => item.type == 'TABLE')
                            .toList()[index];

                        return InkWell(
                          onTap: () {
                            if (tableCtrl
                                    .viewFloorDesignResData.seatSelection ==
                                true) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return Dialog(
                                        alignment: Alignment.center,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 15, 20, 25),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          ImageCons.imgChair,
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      20),
                                                          width: AppScreenUtil()
                                                              .screenWidth(20),
                                                        ),
                                                        SizedBox(
                                                            width: AppScreenUtil()
                                                                .screenHeight(
                                                                    15)),
                                                        Text(
                                                          'Add Seat',
                                                          style: TextStyle(
                                                            fontSize: 10.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '${tableItem.name}',
                                                      style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Transform.translate(
                                                  offset: Offset(25, -3),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'All',
                                                        style: TextStyle(
                                                          fontSize: 9.0,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Transform.translate(
                                                        offset: Offset(-10, 0),
                                                        child: Transform.scale(
                                                          scale: 0.8,
                                                          child: Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor:
                                                                Colors.black,
                                                            hoverColor:
                                                                Colors.black,
                                                            value: _isChecked,
                                                            onChanged: (bool?
                                                                newValue) {
                                                              setState(() {
                                                                _isChecked =
                                                                    newValue ??
                                                                        false;
                                                                if (_isChecked) {
                                                                  // Select all chairs for this table, avoiding duplicates
                                                                  tableCtrl
                                                                      .viewFloorDesignResData
                                                                      .floorCanvas!
                                                                      .where((item) =>
                                                                          item.type ==
                                                                              'CHAIR' &&
                                                                          item.tableId ==
                                                                              tableItem
                                                                                  .id)
                                                                      .forEach(
                                                                          (chair) {
                                                                    if (!selectedChairIds
                                                                        .contains(
                                                                            chair.id)) {
                                                                      selectedChairIds
                                                                          .add(chair
                                                                              .id!);
                                                                    }
                                                                  });
                                                                  // Add table to selectedTableIds if not already added
                                                                  if (!selectedTableIds
                                                                      .contains(
                                                                          tableItem
                                                                              .id)) {
                                                                    selectedTableIds.add(
                                                                        tableItem
                                                                            .id!);
                                                                  }
                                                                } else {
                                                                  // Deselect all chairs for this table
                                                                  tableCtrl
                                                                      .viewFloorDesignResData
                                                                      .floorCanvas!
                                                                      .where((item) =>
                                                                          item.type ==
                                                                              'CHAIR' &&
                                                                          item.tableId ==
                                                                              tableItem
                                                                                  .id)
                                                                      .forEach(
                                                                          (chair) {
                                                                    selectedChairIds
                                                                        .remove(
                                                                            chair.id);
                                                                  });
                                                                  // Remove table from selectedTableIds
                                                                  selectedTableIds
                                                                      .remove(
                                                                          tableItem
                                                                              .id);
                                                                }
                                                              });
                                                              print(
                                                                  'Selected Tables : $selectedTableIds');
                                                              print(
                                                                  'Selected Chairs : $selectedChairIds');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Transform.translate(
                                                  offset: Offset(0, -6),
                                                  child: Wrap(
                                                    alignment:
                                                        WrapAlignment.center,
                                                    direction: Axis.horizontal,
                                                    runSpacing: 7,
                                                    children:
                                                        List<Widget>.generate(
                                                      tableCtrl
                                                          .viewFloorDesignResData
                                                          .floorCanvas!
                                                          .where((item) =>
                                                              item.type ==
                                                                  'CHAIR' &&
                                                              item.tableId ==
                                                                  tableItem.id)
                                                          .length,
                                                      (int index) {
                                                        var chairItem = tableCtrl
                                                            .viewFloorDesignResData
                                                            .floorCanvas!
                                                            .where((item) =>
                                                                item.type ==
                                                                    'CHAIR' &&
                                                                item.tableId ==
                                                                    tableItem
                                                                        .id)
                                                            .toList()[index];

                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (selectedChairIds
                                                                  .contains(
                                                                      chairItem
                                                                          .id)) {
                                                                // Chair is already selected, so remove it
                                                                selectedChairIds
                                                                    .remove(
                                                                        chairItem
                                                                            .id);

                                                                // Check if all chairs for this table are deselected, then deselect the table
                                                                if (!tableCtrl
                                                                    .viewFloorDesignResData
                                                                    .floorCanvas!
                                                                    .any((item) =>
                                                                        item.type ==
                                                                            'CHAIR' &&
                                                                        item.tableId ==
                                                                            tableItem.id)) {
                                                                  selectedTableIds
                                                                      .remove(
                                                                          tableItem
                                                                              .id);
                                                                }
                                                              } else {
                                                                // Chair is not selected, so add it
                                                                selectedChairIds
                                                                    .add(chairItem
                                                                        .id!);

                                                                // Add table ID to selectedTableIds if not already added
                                                                if (!selectedTableIds
                                                                    .contains(
                                                                        tableItem
                                                                            .id)) {
                                                                  selectedTableIds
                                                                      .add(tableItem
                                                                          .id!);
                                                                }
                                                              }

                                                              bool anyChairSelected = tableCtrl
                                                                  .viewFloorDesignResData
                                                                  .floorCanvas!
                                                                  .any((item) =>
                                                                      item.type ==
                                                                          'CHAIR' &&
                                                                      item.tableId ==
                                                                          tableItem
                                                                              .id &&
                                                                      selectedChairIds
                                                                          .contains(
                                                                              item.id));
                                                            });
                                                            print(
                                                                'Selected Tables : $selectedTableIds');
                                                            print(
                                                                'Selected Chairs : $selectedChairIds');
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: Container(
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      25),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      28),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: selectedChairIds.contains(
                                                                          chairItem
                                                                              .id)
                                                                      ? Colors
                                                                          .pink
                                                                      : Colors
                                                                          .green,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '${chairItem.name}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        8.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(5)),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: CustomButton(
                                                    onTap: () {
                                                      setState(() {
                                                        bool anyChairsSelected = tableCtrl
                                                            .viewFloorDesignResData
                                                            .floorCanvas!
                                                            .any((item) =>
                                                                item.type ==
                                                                    'CHAIR' &&
                                                                item.tableId ==
                                                                    tableItem
                                                                        .id &&
                                                                selectedChairIds
                                                                    .contains(
                                                                        item.id));
                                                        if (!anyChairsSelected) {
                                                          // No chairs are selected for this table, remove the table ID from selectedTableIds
                                                          selectedTableIds
                                                              .remove(
                                                                  tableItem.id);
                                                        }
                                                      });
                                                      print(
                                                          'Selected Tables : $selectedTableIds');
                                                      print(
                                                          'Selected Chairs : $selectedChairIds');
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    buttonHeight:
                                                        AppScreenUtil()
                                                            .screenHeight(19),
                                                    buttonWidth: AppScreenUtil()
                                                        .screenWidth(55),
                                                    buttonColor: confirmColor,
                                                    borderRadius: 5.0,
                                                    buttonText: 'Add',
                                                    buttonLabelStyle:
                                                        totalRevenueTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              setState(() {
                                if (selectedTableIds.contains(tableItem.id)) {
                                  // Table is already selected, so remove it
                                  selectedTableIds.remove(tableItem.id);

                                  // Remove associated chairs from selectedChairIds
                                  selectedChairIds.removeWhere((chairId) =>
                                      tableCtrl
                                          .viewFloorDesignResData.floorCanvas!
                                          .any((item) =>
                                              item.type == 'CHAIR' &&
                                              item.id == chairId &&
                                              item.tableId == tableItem.id));
                                } else {
                                  // Table is not selected, so add it
                                  selectedTableIds.add(tableItem.id!);

                                  // Add associated chairs to selectedChairIds
                                  tableCtrl.viewFloorDesignResData.floorCanvas!
                                      .where((item) =>
                                          item.type == 'CHAIR' &&
                                          item.tableId == tableItem.id)
                                      .forEach((chair) {
                                    selectedChairIds.add(chair.id!);
                                  });
                                }
                              });
                            }
                            print('Selected Tables : $selectedTableIds');
                            print('Selected Chairs : $selectedChairIds');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Container(
                              height: AppScreenUtil().screenHeight(61.75),
                              width: AppScreenUtil().screenWidth(61.72),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedTableIds.contains(tableItem.id)
                                      ? Colors.pink
                                      : Colors.green,
                                ),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text('${tableItem.name}',
                                    textAlign: TextAlign.center,
                                    style: pangramRegular(
                                        size: 11.0, color: blackColor)),
                              ),
                            ),
                          ),
                        );
                      },
                    )))
          ]),
        ),
      ),
    );
  }
}

class TableItem {
  final FloorCanva? table;
  List<String> chairs; // List to hold selected chairs
  List<String> tableList;
  String? floorId;
  TableItem({
    required this.table,
    this.chairs = const [],
    this.tableList = const [],
    this.floorId,
  });
}
