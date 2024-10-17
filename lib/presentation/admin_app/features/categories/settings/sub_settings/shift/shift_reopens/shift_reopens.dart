// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/outlined_table.dart';

class ShiftReOpens extends StatefulWidget {
  const ShiftReOpens({super.key});

  @override
  State<ShiftReOpens> createState() => _ShiftReOpensState();
}

class _ShiftReOpensState extends State<ShiftReOpens> {
  final passwordController = TextEditingController();
  bool isTapped = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController shiftReOpensController = ScrollController();
  final searchKeywordController = TextEditingController();

  List<String>shiftNo=[
    'SH0001',
    'SH0001',
    'SH0001',
    'SH0001',
    'SH0001',
    'SH0001',
  ];

  List<String>shiftDate=[
    '12-03-2024',
    '12-03-2024',
    '12-03-2024',
    '12-03-2024',
    '12-03-2024',
    '12-03-2024',
  ];
  List<String>shiftOpenTime=[
    '4.00 pm',
    '4.00 pm',
    '4.00 pm',
    '4.00 pm',
    '4.00 pm',
    '4.00 pm',
  ];
  List<String>shiftClosingTime=[
    '10.00 pm',
    '10.00 pm',
    '10.00 pm',
    '10.00 pm',
    '10.00 pm',
    '10.00 pm',
  ];
  List<String>shiftUser=[
    'Admin',
    'Admin',
    'Admin',
    'Admin',
    'Admin',
    'Admin',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isTapped == false?Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 25, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Password',
                style: tableDetailHeadTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              ColoredTextField(
                  color: textFieldColor,
                  controller: passwordController,
                  title: 'Password'),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: blackColor, borderRadius: BorderRadius.circular(11)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Submit',
                            style: confirmTextStyle, textAlign: TextAlign.center),
                      )),
                  onTap: () {
                    setState(() {
                      isTapped = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ):Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.translate(offset: Offset(0,-10),
                        child: Text(
                          'Shift Reopen',
                          style: tableDetailHeadTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(152),
                        height: AppScreenUtil().screenHeight( 31),
                        child: TextField(
                          style: searchInputTextStyle,
                          cursorColor: searchTextColor,
                          controller: searchKeywordController,
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.only(left: 12, right: 10),
                            hintText: 'Search Shift',
                            hintStyle: largeTextStyle,
                            filled: true,
                            fillColor: whiteColor,
                            suffixIconConstraints: BoxConstraints(
                                maxWidth: AppScreenUtil().screenWidth(43)),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: blackColor,
                                size: 18,
                              ),
                              onPressed: () {
                                if (searchKeywordController.text.isEmpty) {
                                  Dialog(
                                    child: Container(
                                      height: 305,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  );
                                  Dialog(
                                    child: Container(
                                      height: 305,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  );
                                  final snackBar = SnackBar(
                                    backgroundColor: backGroundColor,
                                    content: SizedBox(
                                      height: 30,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Please enter a keyword to search',
                                            style: dialogTextStyle,
                                          )),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             SearchProductList(searchKeywordController.text)
                                  //     ));
                                }
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: subDividerColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: subDividerColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  ColoredDropDown(
                    dropDownItems: _dropdownItems,
                    title: 'Branch',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(14),
                  ),
                  ColoredDropDown(
                    dropDownItems: _dropdownItems,
                    title: 'Customer',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(12),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: 83,
                        height: 24,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: blackColor)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Submit',
                              style: confirmTextStyle, textAlign: TextAlign.center),
                        )),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,),
              child: OutLinedTable(
                  visible: false,
                  scrollController: shiftReOpensController,
                  // tableHeight: MediaQuery.of(context).size.height / 2,
                  tableDataWidgets: List.generate(shiftNo.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(38),
                        width: AppScreenUtil().screenWidth(605),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: searchTextColor.withOpacity(0.15)),
                            color: Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),

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
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(
                                        shiftNo[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                      child: Text(shiftDate[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(shiftOpenTime[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(shiftClosingTime[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(90),
                                    child: Center(
                                      child: Text(shiftUser[index],
                                          style: tableSubTitleLabelStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        bottomBar(context);
                      },
                    );
                  }),
                  tableRowWidth: 605,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Shift No.',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
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
                              'Shift Date',
                              style: tableTitleLabelStyle,
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
                              'Shift Open Time',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shift Closing Time',
                              style: tableTitleLabelStyle,
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
                              'Shift User',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
            ),
            // SizedBox(height: AppScreenUtil().screenHeight(5),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Clear',
                          style: categoryMenuTextStyle,
                          textAlign: TextAlign.center),
                    )),
                SizedBox(
                  width: AppScreenUtil().screenWidth(8),
                ),
                InkWell(
                  child: Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: blackColor)),
                      padding: EdgeInsets.only(bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Submit',
                            style: confirmTextStyle,
                            textAlign: TextAlign.center),
                      )),
                  onTap: (){
                    clearDialogue(context);
                  },
                ),
              ],
            ),
            SizedBox(height: AppScreenUtil().screenHeight(70),),
          ],
        ),
      ],
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
  void clearDialogue(BuildContext context,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Set border radius here
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 30),
            decoration: BoxDecoration(  borderRadius: BorderRadius.circular(7.0),color: constantWhite,),
            // height: AppScreenUtil().screenHeight(191),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageCons.imgAlertIconMain),
                SizedBox(height: AppScreenUtil().screenHeight(10),),
                Text('Are you sure want to reopen the shift',style: shiftOpenTextStyle,),
                SizedBox(height: AppScreenUtil().screenHeight(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 83,
                        height: 24,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: blackColor)),
                        padding: EdgeInsets.only(bottom: 2),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('No',
                              style: categoryMenuTextStyle,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: AppScreenUtil().screenWidth(10),
                    ),
                    InkWell(
                      child: Container(
                          width: 83,
                          height: 24,
                          decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(color: blackColor)),
                          padding: EdgeInsets.only(bottom: 2),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Yes',
                                style: confirmTextStyle,
                                textAlign: TextAlign.center),
                          )),
                      onTap: (){
                        Navigator.pop(context);
                        reOpenShiftDialogue(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  void startTimer() {
    Timer(Duration(seconds: 5), () {
      // After 5 seconds, show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Timer Dialog"),
            content: Text("This is a dialog shown after 5 seconds."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    });
  }
  void reOpenShiftDialogue(BuildContext context,) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(); // Close the dialog
        });
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Set border radius here
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
            decoration: BoxDecoration(  borderRadius: BorderRadius.circular(7.0),color: constantWhite,),
            // height: AppScreenUtil().screenHeight(191),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 5),
                  child:  Lottie.asset('assets/gif_delete_success.json',height: 70),
                ),
                Text('Shift reopened successfully',style: shiftReOpenTextStyle,),
              ],
            ),
          ),
        );
      },
    );
  }
}
