// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../admin_app/widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/label_dropdown.dart';
import '../../../../widgets/label_textfield.dart';
import '../../../../widgets/user_outlined_textfield.dart';

class UserReservation extends StatefulWidget {
  final Function(int,dynamic) editReservation;
  dynamic tappedCategoryItem;
  UserReservation(String? tappedCategoryItem,
      {required this.editReservation, super.key});

  @override
  State<UserReservation> createState() => _UserReservationState();
}

class _UserReservationState extends State<UserReservation> {
  ///API
  final posCtrl = Get.find<POSController>();
  int? tappedIndex;
  final customerController = TextEditingController();
  final mobileController = TextEditingController();
  final personController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final totalPersonController = TextEditingController();
  final noteController = TextEditingController();
  final floorController = TextEditingController();

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

  List<bool> isSelected = [];
  final customerNameController = TextEditingController();
  final customerMobileController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerAddressController = TextEditingController();
  bool tappedMoreDetails = false;
  @override
  void initState() {
    posCtrl.viewReservationList(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 40),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Obx(
                  () => (posCtrl.isReservationListLoading.value == true)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: confirmColor,
                            ),
                          ),
                        )
                      : (posCtrl.isReservationListError.value == true)
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              child: const Center(child: EmptyLayout()))
                          : (posCtrl.viewReservationListResData.list!.isEmpty)
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: Center(
                                      child: Text(
                                    'No Order Found',
                                    style: bookedTextStyle,
                                  )))
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///Table heading
                                    Container(
                                      height: AppScreenUtil().screenHeight(29),
                                      width: AppScreenUtil().screenWidth(950),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                AppScreenUtil().screenWidth(6)),
                                            topRight: Radius.circular(
                                                AppScreenUtil()
                                                    .screenWidth(6))),
                                        color: userTableHeadColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppScreenUtil()
                                                .screenWidth(14)),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'No',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Sequence',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Name',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Mobile',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Date',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Time',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Total Person',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Table',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(100),
                                                  child: Center(
                                                    child: Text(
                                                      'Note',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
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
                                                  width: AppScreenUtil()
                                                      .screenWidth(90),
                                                  child: Center(
                                                    child: Text(
                                                      'Status',
                                                      style: userSubTextStyle,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    ///Contents
                                    Column(
                                        children: List.generate(
                                            posCtrl.viewReservationListResData
                                                .list!.length, (index) {
                                      int slNumber = index + 1;
                                      var item = posCtrl
                                          .viewReservationListResData
                                          .list![index];
                                      DateTime orderTime = DateTime.parse(
                                          '${item.date} ${item.time}');
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(orderTime);
                                      String timeString =
                                          '${posCtrl.viewReservationListResData.list![index].time}';
                                      DateTime parsedTime = DateTime.parse(
                                          "${posCtrl.viewReservationListResData.list![index].date} $timeString");
                                      int hour = parsedTime.hour > 12
                                          ? parsedTime.hour - 12
                                          : parsedTime.hour;
                                      int minute = parsedTime.minute;
                                      String period =
                                          parsedTime.hour < 12 ? 'AM' : 'PM';
                                      // Extract hour and minute
                                      String formatTime(int time) {
                                        return time.toString().padLeft(2, '0');
                                      }

                                      List<String>? tableNames = posCtrl
                                          .viewReservationListResData
                                          .list![index]
                                          .tableNames;
                                      return InkWell(
                                        child: Container(
                                          height:
                                              AppScreenUtil().screenHeight(29),
                                          width:
                                              AppScreenUtil().screenWidth(950),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: userTableHeadColor,
                                                width: 0.8),
                                            color: tappedIndex == index
                                                ? swipeTextColor
                                                : whiteColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppScreenUtil()
                                                    .screenWidth(14)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          slNumber.toString(),
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '${posCtrl.viewReservationListResData.list![index].name}',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '${posCtrl.viewReservationListResData.list![index].customerNameL}',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '${posCtrl.viewReservationListResData.list![index].mobileNo}',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          formattedDate,
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '${formatTime(hour)}:${formatTime(minute)} $period',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
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
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: Text(
                                                          '${posCtrl.viewReservationListResData.list![index].totalPerson}',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(90),
                                                      child: Center(
                                                        child: tableNames !=
                                                                    null &&
                                                                tableNames
                                                                    .isNotEmpty
                                                            ? Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            25),
                                                                child: ListView
                                                                    .separated(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      tableNames
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          idx) {
                                                                    String
                                                                        tableName =
                                                                        tableNames[
                                                                            idx];
                                                                    return Center(
                                                                        child:
                                                                            Row(
                                                                      children: [
                                                                        Text(
                                                                          tableName.isNotEmpty
                                                                              ? tableName
                                                                              : 'Not Selected',
                                                                          style:
                                                                              categoryRedTextStyle,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ],
                                                                    ));
                                                                  },
                                                                  separatorBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int idx) {
                                                                    return Center(
                                                                      child:
                                                                          Text(
                                                                        ',',
                                                                        style:
                                                                            categoryRedTextStyle, // Adjust style as needed
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              )
                                                            : Text(
                                                                'Not Selected',
                                                                style:
                                                                    categoryRedTextStyle,
                                                              ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(100),
                                                      child: Center(
                                                        child: Text(
                                                          '${posCtrl.viewReservationListResData.list![index].note}',
                                                          style: tappedIndex ==
                                                                  index
                                                              ? submitTextStyle
                                                              : backTextStyle,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                    color: Colors.transparent,
                                                    width: AppScreenUtil()
                                                        .screenWidth(90),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            1),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        55),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        16),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                              color: posCtrl
                                                                          .viewReservationListResData
                                                                          .list![
                                                                              index]
                                                                          .status ==
                                                                      'cancel'
                                                                  ? userDraftBackgroundColor
                                                                  : posCtrl.viewReservationListResData.list![index]
                                                                              .status ==
                                                                          'COMPLETED'
                                                                      ? userPostBackgroundColor
                                                                      : userPendingBackgroundColor,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                '${posCtrl.viewReservationListResData.list![index].status}',
                                                                style: posCtrl
                                                                            .viewReservationListResData
                                                                            .list![
                                                                                index]
                                                                            .status ==
                                                                        'cancel'
                                                                    ? userDraftButtonTextStyle
                                                                    : posCtrl.viewReservationListResData.list![index].status ==
                                                                            'COMPLETED'
                                                                        ? userPostedButtonTextStyle
                                                                        : userPendingButtonTextStyle,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ))
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          posCtrl.viewReservationListResData
                                                      .list![index].status ==
                                                  'PENDING'
                                              ? bottomBar(
                                                  context,
                                                  '${posCtrl.viewReservationListResData.list![index].id}',
                                                  index)
                                              : dispose;
                                          // setState(() {
                                          //   tappedIndex = index;
                                          // });
                                        },
                                      );
                                    })),
                                  ],
                                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bottomBar(BuildContext context, String reservationId, index) {
    DateTime now = DateTime.now();
    String currentDateAndTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
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
                padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        cancelReservation(context, reservationId);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: AppScreenUtil().screenWidth(52),
                            height: AppScreenUtil().screenHeight(52),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: constantWhite,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    color:
                                        inventoryBottomSheetItemBoxshadowColor,
                                  )
                                ]),
                            // ignore: deprecated_member_use
                            child: Center(
                                child: SvgPicture.asset(
                              ImageCons.imgUserCancel,
                              width: 20.53,
                              height: 16,
                            )),
                          ),
                          // SizedBox(height: AppScreenUtil().screenHeight(2)),
                          Text(
                            'Cancel',
                            style: userBottomBarTextStyle,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        widget.editReservation(index,reservationId);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: AppScreenUtil().screenWidth(52),
                            height: AppScreenUtil().screenHeight(52),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: constantWhite,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    color:
                                        inventoryBottomSheetItemBoxshadowColor,
                                  )
                                ]),
                            // ignore: deprecated_member_use
                            child: Center(
                                child: SvgPicture.asset(
                              ImageCons.imgUserEdit,
                              width: 15.29,
                              height: 14,
                            )),
                          ),
                          // SizedBox(height: AppScreenUtil().screenHeight(2)),
                          Text(
                            'Edit',
                            style: userBottomBarTextStyle,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        posCtrl
                            .addOrderFromReservation(
                                currentDateAndTime, reservationId)
                            .then((value) {
                          if (value == true) {
                            posCtrl.viewReservationList(0);
                            posCtrl.productOrderId.value =
                                '${posCtrl.viewAddOrderFromReservationResData.orderId}';
                                posCtrl.viewPosOrderByIdRes(posCtrl.viewAddOrderFromReservationResData.orderId);
                            posCtrl.isOrderReservationIsSuccess = true.obs;
                            posCtrl.orderStatus = posCtrl .viewPosOrderByIdResData.status!.obs;
                            print('Reservation Order Status: ${posCtrl.orderStatus}');
                            widget.tappedCategoryItem = 'Home';
                            AppUtils.oneTimeSnackBar('New order added',bgColor: payButtonColor);
                            posCtrl.orderStatus = 'OrderFromReservation'.obs;
                            print(
                                'Tapped Update: ${widget.tappedCategoryItem},Tapped: ${posCtrl.isOrderReservationIsSuccess.value}');
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: AppScreenUtil().screenWidth(52),
                            height: AppScreenUtil().screenHeight(52),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: constantWhite,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    color:
                                        inventoryBottomSheetItemBoxshadowColor,
                                  )
                                ]),
                            // ignore: deprecated_member_use
                            child: Center(
                                child: SvgPicture.asset(
                              ImageCons.imgUserAdd,
                              width: 15.29,
                              height: 14.5,
                            )),
                          ),
                          // SizedBox(height: AppScreenUtil().screenHeight(2)),
                          Text(
                            'Add',
                            style: userBottomBarTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void cancelReservation(BuildContext context, String reservationId) {
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
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: constantWhite,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cancel Reservation',
                          style: cancelReservationTextStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(14),
                        ),
                        Text(
                          'Are you sure to cancel reservation',
                          style: kotDarkModeUnselectedTabLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CustomButton(
                                buttonHeight:
                                    AppScreenUtil().screenHeight(26.86),
                                buttonWidth: AppScreenUtil().screenWidth(79),
                                buttonColor: Colors.white,
                                borderRadius: 3,
                                buttonText: 'Cancel',
                                buttonLabelStyle: addReservationLabelTextStyle,
                                border: Border.all(
                                  color: blackColor,
                                  width: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            Obx(
                              () => (posCtrl.isCancelReservationLoading.value ==
                                      true)
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              AppScreenUtil().screenHeight(3)),
                                      child: CircularProgressIndicator(
                                        color: confirmColor,
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        posCtrl
                                            .cancelReservation(
                                                reservationId, 'cancel')
                                            .then((value) {
                                          if (value == true) {
                                            posCtrl.viewReservationList(0);
                                            AppUtils.oneTimeSnackBar(
                                                'Reservation Cancelled',
                                                bgColor: payButtonColor);
                                            Navigator.pop(context);
                                            print(
                                                'Reservation id: $reservationId');
                                          } else {
                                            print('Booking Not cancelled');
                                            Navigator.of(context).pop();
                                          }
                                        });
                                      },
                                      child: CustomButton(
                                        buttonHeight:
                                            AppScreenUtil().screenHeight(26.86),
                                        buttonWidth:
                                            AppScreenUtil().screenWidth(79),
                                        buttonColor: cartScreenButtonRedColor,
                                        borderRadius: 3,
                                        buttonText: 'Confirm',
                                        buttonLabelStyle:
                                            userCancelDialogueTextStyle,
                                      ),
                                    ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
