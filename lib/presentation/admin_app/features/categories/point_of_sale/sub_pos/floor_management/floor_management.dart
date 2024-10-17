// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../utiles/image_constant.dart';
import '../../../../../../user_app/features/categories/pos/confirmPayment/confirm_payment.dart';
import '../../../../../../user_app/widgets/custom_button.dart';
import 'floor_management_controller.dart';

class FloorManagement extends StatefulWidget {
  const FloorManagement({super.key});

  @override
  State<FloorManagement> createState() => _FloorManagementState();
}

class _FloorManagementState extends State<FloorManagement> {
  dynamic tabTapped = 'Branch';
  final searchKeywordController = TextEditingController();
  String? tableSelected;
  bool _isChecked = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
  bool isSubmitted = false;
  List<String> shapes = ['Rectangle', 'Ellipse', 'Polygon'];

  List<IconData> iconShapes = [
    Icons.square_outlined,
    Icons.circle_outlined,
    Icons.square_foot
  ];
  dynamic tappedIndex;
  dynamic selectedShape;
  dynamic selectedColor;
  dynamic selectedShapeCount;
  dynamic selectedTableTextColor;
  bool isShapeSelected = false;
  bool addTable = false;
  bool isBackgroundColorAdded = false;
  List<dynamic> selectedTable = [];
  List<dynamic> selectedTableNo = [];
  List<dynamic> selectedTableColor = [];
  List<dynamic> selectedTextColor = [];
  dynamic rectangle = BoxShape.rectangle;
  dynamic circle = BoxShape.circle;
  var value = 1;
  dynamic tappedTable;
  bool tableDetailTapped = false;
  Color mycolor = Colors.red;
  Color tableColor = Colors.white;
  dynamic _secondaryFont = 'Segoe UI Semibold';
  Color myBackGroundColor = Colors.white;
  Color backgroundColorAfterEdit = Colors.white;
  Color textColorAfterEdit = Colors.red;
  final FloorManagementLeftMenuController floorLeftEMenuCtrl =
      Get.put(FloorManagementLeftMenuController());
  String? _selectedItem;
  final List<String> branch = ['01', '02', '03'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 1.7,
      padding: EdgeInsets.fromLTRB(0, 0, 15, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: 25, bottom: 30, top: 5),
                      child: Column(
                        children: [
                          tabTapped == 'Branch'
                              ? Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: whiteColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              adminDashBoardDateDropDownContainerBoxShadowColor,
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      height: AppScreenUtil().screenHeight(35),
                                      child: Container(
                                        height:
                                            AppScreenUtil().screenHeight(35),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: whiteColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color:
                                                  adminDashBoardDateDropDownContainerBoxShadowColor,
                                              offset: Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        // child: DropdownSearch<String>(
                                        //   searchBoxDecoration: InputDecoration(
                                        //     contentPadding: EdgeInsets.fromLTRB(
                                        //         10, 8, 10, 12),
                                        //     hintText: 'You Can Search here..',
                                        //     hintStyle: largeTextStyle,
                                        //     fillColor: inventorySelectionColor
                                        //         .withOpacity(0.2),
                                        //     focusColor: inventorySelectionColor
                                        //         .withOpacity(0.2),
                                        //     enabledBorder: OutlineInputBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //       borderSide: BorderSide(
                                        //           color: confirmColor
                                        //               .withOpacity(0.4)),
                                        //     ),
                                        //     focusedBorder: OutlineInputBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //       borderSide: BorderSide(
                                        //           color: confirmColor
                                        //               .withOpacity(0.4)),
                                        //     ),
                                        //     errorBorder: OutlineInputBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //       borderSide: BorderSide(
                                        //           color: confirmColor
                                        //               .withOpacity(0.4)),
                                        //     ),
                                        //     focusedErrorBorder:
                                        //         OutlineInputBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(4),
                                        //       borderSide: BorderSide(
                                        //           color: confirmColor
                                        //               .withOpacity(0.4)),
                                        //     ),
                                        //   ),
                                        //   dropDownButton: Icon(
                                        //     Icons.arrow_drop_down,
                                        //     color: Colors.black,
                                        //   ),
                                        //   // enabled: true,
                                        //   mode: Mode.MENU,
                                        //   showSearchBox: true,
                                        //   showSelectedItem: true,
                                        //   hint: 'Select a Branch',
                                        //   // Providing hint as a string
                                        //   items: branch
                                        //       .map<String>(
                                        //           (String item) => item)
                                        //       .toList(),
                                        //   onChanged: (String? newValue) {
                                        //     setState(() {
                                        //       _selectedItem = newValue;
                                        //     });
                                        //     print(
                                        //         'TappedDropdown: $_selectedItem');
                                        //   },
                                        //   selectedItem: _selectedItem,
                                        //   dropdownBuilder: (context,
                                        //       String? selectedItem,
                                        //       itemAsString) {
                                        //     return Text(
                                        //       itemAsString ?? '',
                                        //       style: largeTextStyle,
                                        //     );
                                        //   },
                                        // ),
                                      ),
                                      // DropdownSearch<String>(items: [
                                      //   "Brazil",
                                      //   "Italia (Disabled)",
                                      //   "Tunisia",
                                      //   'Canada'
                                      // ], onChanged: print, selectedItem: "Brazil"),
                                    ),
                                  ),
                                )
                              : isSubmitted == false
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 20, 10),
                                        height:
                                            AppScreenUtil().screenHeight(143),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: floorContainerBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                              color:
                                                  floorContainerBackgroundBoxShadowColor,
                                              offset: Offset(0, 0),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Create Floor',
                                              style: searchBranchTextStyle,
                                            ),
                                            Transform.translate(
                                              offset: Offset(0, -5),
                                              child: SizedBox(
                                                width: AppScreenUtil()
                                                    .screenWidth(130),
                                                child: Divider(
                                                  color: confirmColor,
                                                  thickness: 0.7,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Name',
                                              style: floorCreateTextStyle,
                                            ),
                                            SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(4),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                      builder:
                                                          (context, setState) {
                                                        return Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25), // Set border radius here
                                                          ),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    25, 18, 20),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                              color:
                                                                  constantWhite,
                                                            ),
                                                            // height: AppScreenUtil().screenHeight(191),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Pick a Color',
                                                                  style:
                                                                      selectFloorTextStyle,
                                                                ),
                                                                SizedBox(
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          15),
                                                                ),
                                                                SingleChildScrollView(
                                                                  child:
                                                                      BlockPicker(
                                                                    useInShowDialog:
                                                                        true,
                                                                    pickerColor:
                                                                        mycolor,
                                                                    //default color
                                                                    onColorChanged:
                                                                        (colorPicked) {
                                                                      //on color picked
                                                                      setState(
                                                                          () {
                                                                        mycolor =
                                                                            colorPicked;
                                                                        print(
                                                                            mycolor);
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: CustomButton(
                                                                      buttonHeight:
                                                                          AppScreenUtil().screenHeight(
                                                                              30),
                                                                      buttonWidth:
                                                                          AppScreenUtil().screenWidth(
                                                                              70),
                                                                      buttonColor:
                                                                          confirmColor,
                                                                      borderRadius:
                                                                          3,
                                                                      buttonText:
                                                                          'Done',
                                                                      buttonLabelStyle:
                                                                          employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 4, 10, 6),
                                                  width: double.infinity,
                                                  height: AppScreenUtil()
                                                      .screenHeight(32),
                                                  decoration: BoxDecoration(
                                                    color: myBackGroundColor ==
                                                            Colors.white
                                                        ? whiteColor
                                                        : myBackGroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            adminDashBoardDateDropDownContainerBoxShadowColor,
                                                        offset: Offset(0, 1),
                                                        blurRadius: 6,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Floor 01',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              _secondaryFont,
                                                          color: mycolor ==
                                                                  Colors.red
                                                              ? confirmColor
                                                              : mycolor,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      SvgPicture.asset(
                                                        ImageCons
                                                            .imgColorPallet,
                                                        height: 21,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(6),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Background Colour',
                                                  style: searchBranchTextStyle,
                                                ),
                                                SizedBox(
                                                  width: AppScreenUtil()
                                                      .screenWidth(5),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return StatefulBuilder(
                                                          builder: (context,
                                                              setState) {
                                                            return Dialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25), // Set border radius here
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            25,
                                                                            25,
                                                                            18,
                                                                            20),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  color:
                                                                      constantWhite,
                                                                ),
                                                                // height: AppScreenUtil().screenHeight(191),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Pick a Color',
                                                                      style:
                                                                          selectFloorTextStyle,
                                                                    ),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              15),
                                                                    ),
                                                                    SingleChildScrollView(
                                                                      child:
                                                                          BlockPicker(
                                                                        useInShowDialog:
                                                                            true,
                                                                        pickerColor:
                                                                            myBackGroundColor,
                                                                        //default color
                                                                        onColorChanged:
                                                                            (colorPicked) {
                                                                          //on color picked
                                                                          setState(
                                                                              () {
                                                                            myBackGroundColor =
                                                                                colorPicked;
                                                                            print(myBackGroundColor);
                                                                            print(colorPicked);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: CustomButton(
                                                                          buttonHeight: AppScreenUtil().screenHeight(
                                                                              30),
                                                                          buttonWidth: AppScreenUtil().screenWidth(
                                                                              70),
                                                                          buttonColor:
                                                                              confirmColor,
                                                                          borderRadius:
                                                                              3,
                                                                          buttonText:
                                                                              'Done',
                                                                          buttonLabelStyle:
                                                                              employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                    ImageCons.imgColorPallet,
                                                    height: 21,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Transform.translate(
                                              offset: Offset(-16, -16),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isSubmitted = true;
                                                      });
                                                    },
                                                    child: CustomButton(
                                                        buttonHeight:
                                                            AppScreenUtil()
                                                                .screenHeight(
                                                                    18),
                                                        buttonWidth:
                                                            AppScreenUtil()
                                                                .screenWidth(
                                                                    50),
                                                        buttonColor:
                                                            confirmColor,
                                                        borderRadius: 2,
                                                        buttonText: 'Submit',
                                                        buttonLabelStyle:
                                                            floorSubmitButtonTextStyle),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
    isSubmitted == true?Padding(
                                          padding: EdgeInsets.only(left: 40),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 4, 10, 6),
                                            width: double.infinity,
                                            height: AppScreenUtil()
                                                .screenHeight(32),
                                            decoration: BoxDecoration(
                                              color: myBackGroundColor ==
                                                      Colors.white
                                                  ? whiteColor
                                                  : myBackGroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color:
                                                      adminDashBoardDateDropDownContainerBoxShadowColor,
                                                  offset: Offset(0, 1),
                                                  blurRadius: 6,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Floor 01',
                                                style: TextStyle(
                                                  fontFamily: _secondaryFont,
                                                  color: mycolor == Colors.red
                                                      ? confirmColor
                                                      : mycolor,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ):SizedBox(),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(10),
                                        ),
                                        isShapeSelected == true
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(),
                                                  // GestureDetector(
                                                  //     onTap: () {
                                                  //       floorLeftEMenuCtrl
                                                  //           .isFloorManagementDashboardDrawer
                                                  //           .value = true;
                                                  //     },
                                                  //     child: Container(
                                                  //       padding: EdgeInsets.fromLTRB(4, 2.5, 4, 2.5),
                                                  //       height: AppScreenUtil().screenHeight(31),
                                                  //       width: AppScreenUtil().screenWidth(13),
                                                  //       decoration: BoxDecoration(color: floorLeftMenuColor,
                                                  //           borderRadius: BorderRadius.only(
                                                  //               topRight: Radius.circular(
                                                  //                   AppScreenUtil()
                                                  //                       .screenWidth(
                                                  //                           5)),
                                                  //               bottomRight: Radius.circular(
                                                  //                   AppScreenUtil()
                                                  //                       .screenWidth(
                                                  //                           6)))),
                                                  //       child: SvgPicture.asset(
                                                  //         ImageCons
                                                  //             .imgFloorManagementLeftMenu,
                                                  //         height: 35,
                                                  //         width: 60,
                                                  //       ),
                                                  //     )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        addTable = true;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: CustomButton(
                                                          buttonHeight:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      19),
                                                          buttonWidth:
                                                              AppScreenUtil()
                                                                  .screenWidth(
                                                                      57),
                                                          buttonColor: redColor,
                                                          borderRadius: 4,
                                                          buttonText:
                                                              'Add Table',
                                                          buttonLabelStyle:
                                                              floorSubmitButtonTextStyle),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(25),
                                        ),
                                        isShapeSelected == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: Column(
                                                  children: [
                                                    Obx(
                                                      () => Wrap(
                                                        direction:
                                                            Axis.horizontal,
                                                        runSpacing: 20,
                                                        children: List<
                                                                Widget>.generate(
                                                            selectedTable
                                                                .length,
                                                            (int index) {
                                                          print(selectedTable[
                                                              index]);
                                                          print(selectedTableNo[
                                                              index]);
                                                          return InkWell(
                                                              onTap: () {
                                                                setState(
                                                                  () {
                                                                    tappedTable =
                                                                        'T 0${selectedTableNo[index]}';
                                                                    tableDetailTapped =
                                                                        true;
                                                                    floorLeftEMenuCtrl
                                                                            .floorTableSelectedNumber
                                                                            .value =
                                                                        tappedTable;
                                                                  },
                                                                );
                                                                floorLeftEMenuCtrl
                                                                        .floorTableSelectedNumber
                                                                        .value =
                                                                    'T 0${selectedTableNo[index]}';
                                                                print(floorLeftEMenuCtrl
                                                                    .floorTableSelectedNumber
                                                                    .value);
                                                                floorLeftEMenuCtrl
                                                                    .isFloorManagementDashboardDrawer
                                                                    .value = true;
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          48),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          48),
                                                                  decoration: BoxDecoration(
                                                                      shape: selectedTable[index] == 'Rectangle' ? BoxShape.rectangle : BoxShape.circle,
                                                                      // color: selectedColor[index]==null?whiteColor:selectedColor[index],
                                                                      color: floorLeftEMenuCtrl.floorTableSelectedColor.value,
                                                                      border: Border.all(color: floorLeftEMenuCtrl.floorTableSelectedColor.value == Colors.white ? confirmColor : floorLeftEMenuCtrl.floorTableSelectedColor.value)
                                                                      // boxShadow: const [
                                                                      //   BoxShadow(
                                                                      //     color:
                                                                      //         adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                      //     offset: Offset(
                                                                      //         0,
                                                                      //         0),
                                                                      //     blurRadius:
                                                                      //         6,
                                                                      //   ),
                                                                      // ],
                                                                      ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      floorLeftEMenuCtrl.floorTableSelectedNumber.value ==
                                                                              ''
                                                                          ? 'T 0${selectedTableNo[index]}'
                                                                          : floorLeftEMenuCtrl
                                                                              .floorTableSelectedNumber
                                                                              .value,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            _secondaryFont,
                                                                        color:
                                                                            blackColor,
                                                                        // selectedTableTextColor[0]==null?Colors.red:selectedTableTextColor[index],
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ));
                                                        }).toList(),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                            : SizedBox()
                                      ],
                                    )
                        ],
                      )))),
          tabTapped == 'Table'
              ? isShapeSelected == false || addTable == true
                  ? Transform.translate(
                      offset: Offset(0, 30),
                      child: Padding(
                        padding: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 7, bottom: 7),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                          adminDashBoardDateDropDownContainerBoxShadowColor,
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    // floorLeftEMenuCtrl
                                    //     .isFloorManagementDashboardDrawer
                                    //     .value = true;
                                  },
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: shapes.length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              tappedIndex = index;
                                              selectedShape = shapes[index];
                                              isShapeSelected = true;
                                              addTable = false;
                                              selectedTable.add(
                                                selectedShape,
                                              );
                                              selectedShapeCount = value++;
                                              selectedTableNo
                                                  .add(selectedShapeCount);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 7, 10, 7),
                                            decoration: BoxDecoration(
                                                color: tappedIndex == index
                                                    ? inventorySelectionColor
                                                    : whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  shapes[index],
                                                  style:
                                                      userCancelReservationTextStyle,
                                                ),
                                                Icon(
                                                  iconShapes[index],
                                                  color: confirmColor,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                              height: AppScreenUtil()
                                                  .screenHeight(5));
                                        },
                                      )
                                    ],
                                  ),
                                )),
                            Transform.translate(
                              offset: Offset(0, -23),
                              child: Padding(
                                  padding: EdgeInsets.only(right: 70),
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 55,
                                    color: whiteColor,
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
          Container(
            alignment: Alignment(0.0, 1.0),
            padding: EdgeInsets.only(left: 15),
            child: Container(
              padding: EdgeInsets.fromLTRB(26, 16, 26, 14),
              height: AppScreenUtil().screenHeight(85),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      tabPageLeftGradientColor,
                      tabPageRightGradientColor,
                    ]),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabTapped = 'Branch';
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                              color: tabTapped == 'Branch'
                                  ? whiteColor
                                  : Colors.transparent),
                          child: SvgPicture.asset(
                            ImageCons.imgBranch,
                            color: tabTapped == 'Branch'
                                ? confirmColor
                                : whiteColor,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          'Branch',
                          style: posContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabTapped = 'Floor';
                        isSubmitted = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                              color: tabTapped == 'Floor'
                                  ? whiteColor
                                  : Colors.transparent),
                          child: SvgPicture.asset(
                            ImageCons.imgFloor,
                            color: tabTapped == 'Floor'
                                ? confirmColor
                                : whiteColor,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          'Floor',
                          style: posContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabTapped = 'Table';
                        isSubmitted = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                              color: tabTapped == 'Table'
                                  ? whiteColor
                                  : Colors.transparent),
                          child: SvgPicture.asset(
                            ImageCons.imgPosFloorTables,
                            color: tabTapped == 'Table'
                                ? confirmColor
                                : whiteColor,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          'Table',
                          style: posContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabTapped = 'Shapes';
                        isSubmitted = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                              color: tabTapped == 'Shapes'
                                  ? whiteColor
                                  : Colors.transparent),
                          child: SvgPicture.asset(
                            ImageCons.imgShapes,
                            color: tabTapped == 'Shapes'
                                ? confirmColor
                                : whiteColor,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(3),
                        ),
                        Text(
                          'Shapes',
                          style: posContainerTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void colorPaletteAfterTableCreated(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Set border radius here
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 25, 18, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: constantWhite,
                ),
                // height: AppScreenUtil().screenHeight(191),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pick a Color',
                      style: selectFloorTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    SingleChildScrollView(
                      child: BlockPicker(
                        useInShowDialog: true,
                        pickerColor: tableColor,
                        //default color
                        onColorChanged: (colorPicked) {
                          //on color picked
                          setState(() {
                            tableColor = colorPicked;
                            print(tableColor);
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomButton(
                          buttonHeight: AppScreenUtil().screenHeight(30),
                          buttonWidth: AppScreenUtil().screenWidth(70),
                          buttonColor: confirmColor,
                          borderRadius: 3,
                          buttonText: 'Done',
                          buttonLabelStyle:
                              employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class customStyleArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    final double triangleH = 10;
    final double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..close();

    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
