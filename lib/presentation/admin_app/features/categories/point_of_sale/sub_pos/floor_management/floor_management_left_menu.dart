// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_items.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../user_app/widgets/custom_button.dart';
import 'floor_management_controller.dart';

class FloorManagementDashBoardDrawer extends StatelessWidget {
  FloorManagementDashBoardDrawer({super.key});

  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(10),
  );
  final FloorManagementLeftMenuController floorLeftEMenuCtrl =
      Get.put(FloorManagementLeftMenuController());
  Color tableColor = Colors.white;
  final renameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 850),
        height: AppScreenUtil().screenHeight(370),
        width:
            (floorLeftEMenuCtrl.isFloorManagementDashboardDrawer.value == true)
                ? AppScreenUtil().screenWidth(88)
                : 0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  tabPageLeftGradientColor,
                  tabPageRightGradientColor,
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppScreenUtil().screenWidth(16),
                right: AppScreenUtil().screenWidth(16),
                top: AppScreenUtil().screenHeight(7),
                bottom: AppScreenUtil().screenHeight(18)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Drawer items
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl
                            .floorManagementDrawerTappedItem.value = 'Seats';
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Seats'
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 18,
                          iconPath: ImageCons.imgSeat,
                          iconWidth: 13,
                          label: 'Seats'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl
                            .floorManagementDrawerTappedItem.value = 'Color';
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Set border radius here
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(25, 25, 18, 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: constantWhite,
                                    ),
                                    // height: AppScreenUtil().screenHeight(191),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Pick a Color',
                                          style: selectFloorTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(15),
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

                                                floorLeftEMenuCtrl
                                                    .floorTableSelectedColor
                                                    .value = colorPicked;
                                                print(
                                                    'Picked color ${floorLeftEMenuCtrl.floorTableSelectedColor.value}');
                                              });
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: CustomButton(
                                              buttonHeight: AppScreenUtil()
                                                  .screenHeight(30),
                                              buttonWidth: AppScreenUtil()
                                                  .screenWidth(70),
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
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Color'
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 16,
                          iconPath: ImageCons.imgColorBucket,
                          iconWidth: 13,
                          label: 'Color'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl
                            .floorManagementDrawerTappedItem.value = 'Rename';
                        renameController.text = floorLeftEMenuCtrl.floorTableSelectedNumber.value;
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Set border radius here
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(15, 15, 20, 10),
                                    height: AppScreenUtil().screenHeight(143),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: floorContainerBackgroundColor,
                                      borderRadius: BorderRadius.circular(7),
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
                                          'Rename',
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
                                          height:
                                              AppScreenUtil().screenHeight(4),
                                        ),
                                        Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: whiteColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color:
                                                  adminDashBoardDateDropDownContainerBoxShadowColor,
                                                  offset: Offset(0, 1),
                                                  blurRadius: 6,
                                                ),
                                              ],),
                                            child: SizedBox(
                                              height: 32,
                                              child: TextField(
                                                controller:
                                                renameController,
                                                maxLines: 10,
                                                style: payslipSubtitleStyle,
                                                cursorColor: whiteColor,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  isDense: true,
                                                  hintStyle:
                                                      placeholderTextStyle,
                                                  fillColor: blackColor,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: whiteColor),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: whiteColor),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: whiteColor),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(6),
                                        ),
                                        Transform.translate(
                                          offset: Offset(-16, 5),
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    floorLeftEMenuCtrl.floorTableSelectedNumber.value = renameController.text;
                                                  });
                                                 Navigator.pop(context);
                                                },
                                                child: CustomButton(
                                                    buttonHeight:
                                                        AppScreenUtil()
                                                            .screenHeight(18),
                                                    buttonWidth: AppScreenUtil()
                                                        .screenWidth(50),
                                                    buttonColor: confirmColor,
                                                    borderRadius: 2,
                                                    buttonText: 'Submit',
                                                    buttonLabelStyle:
                                                        floorSubmitButtonTextStyle),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Rename'
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 15.7,
                          iconPath: ImageCons.imgRename,
                          iconWidth: 13,
                          label: 'Rename'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl
                            .floorManagementDrawerTappedItem.value = 'Copy';
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Copy'
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 15.3,
                          iconPath: ImageCons.imgCopy,
                          iconWidth: 13,
                          label: 'Copy'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl
                            .floorManagementDrawerTappedItem.value = 'Delete';
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: (floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Delete')
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 16.5,
                          iconPath: ImageCons.imgTableDelete,
                          iconWidth: 13,
                          label: 'Delete'),
                    ),
                    constHeight,
                    GestureDetector(
                      onTap: () {
                        floorLeftEMenuCtrl.floorManagementDrawerTappedItem
                            .value = 'Enable Seat Selection';
                        if (floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value) {
                          floorLeftEMenuCtrl
                              .isFloorManagementDashboardDrawer.value = false;
                        }
                      },
                      child: FloorManagementDashBoardItems(
                          containerColor: (floorLeftEMenuCtrl
                                      .floorManagementDrawerTappedItem.value ==
                                  'Enable Seat Selection')
                              ? employeeDashBoardLeaveDataContainerColor
                              : Colors.transparent,
                          iconHeight: 13.5,
                          iconPath: ImageCons.imgEnableSeat,
                          iconWidth: 13,
                          label: 'Enable Seat Selection'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FloorManagementDashBoardItems extends StatelessWidget {
  final String iconPath;
  final double iconHeight;
  final double iconWidth;
  final String label;
  final Color containerColor;

  const FloorManagementDashBoardItems(
      {super.key,
      required this.iconHeight,
      required this.containerColor,
      required this.iconPath,
      required this.iconWidth,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppScreenUtil().screenHeight(49),
      width: AppScreenUtil().screenWidth(56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: containerColor, width: 2.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: iconHeight,
            width: iconWidth,
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(5.55),
          ),
          Text(
            label,
            style: floorDashBoardDrawerLabelStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
