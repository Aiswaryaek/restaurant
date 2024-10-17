// ignore_for_file: prefer_const_constructors, prefer_conditional_assignment, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_button.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';

class OngoingOrdersList extends StatefulWidget {
  final void Function(String, List<dynamic>) voidFunction;
  final void Function(String,bool) payment;
  dynamic tappedCategoryItem;
  OngoingOrdersList(String? tappedCategoryItem,
      {super.key, required this.voidFunction,required this.payment});

  @override
  State<OngoingOrdersList> createState() => _OngoingOrdersListState();
}

class _OngoingOrdersListState extends State<OngoingOrdersList> {
  final updatePasswordController = TextEditingController();
  String passwordErrorMessage = '';

  ///API
  final ongoingCtrl = Get.find<OngoingOrdersController>();
  final posCtrl = Get.find<POSController>();
  bool tappedDetail = false;
  int ongoingIndex = 0;
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  Duration _calculateTimeDifference(DateTime orderTime, status) {
    return _currentTime
        .difference(status == 'CHDRAFT' ? DateTime.now() : orderTime);
  }

  @override
  void initState() {
    ongoingCtrl.getAllOngoingOrdersList(1);
    posCtrl.getProductListForPOS('', '');
    posCtrl.viewPosConfigurationSettings();
    print(
        'POS ConfigurationSettings for Cancel Order: ${posCtrl.viewPosConfigurationSettingsResData.cancelOrdAuth}');
    _currentTime = DateTime.now();
    _startTimer();
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
                    () => (ongoingCtrl.allOngoingOrdersLoading.value == true)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: confirmColor,
                              ),
                            ),
                          )
                        : (ongoingCtrl.isAllOngoingOrdersListError.value ==
                                true)
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                                child: const Center(child: EmptyLayout()))
                            : (ongoingCtrl.allOngoingOrderViewMainList.isEmpty)
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
                                        height:
                                            AppScreenUtil().screenHeight(29),
                                        width: AppScreenUtil().screenWidth(990),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  AppScreenUtil()
                                                      .screenWidth(6)),
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
                                                        .screenWidth(70),
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                        'Order No.',
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
                                                        'Order Type',
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
                                                        .screenWidth(90),
                                                    child: Center(
                                                      child: Text(
                                                        'Customer',
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
                                                        'Amount',
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
                                                        .screenWidth(120),
                                                    child: Center(
                                                      child: Text(
                                                        'Timer',
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
                                                        'Waiter',
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
                                                        'Status',
                                                        style: userSubTextStyle,
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

                                      ///Contents
                                      Column(
                                          children: List.generate(
                                              ongoingCtrl
                                                  .allOngoingOrderViewMainList
                                                  .length, (index) {
                                        List<String>? tableNames = ongoingCtrl
                                            .allOngoingOrderViewMainList[index]
                                            .tableNames;
                                        // ongoingCtrl.ongoingOrderCount.value =
                                        //     ongoingCtrl
                                        //         .allOngoingOrderViewMainList
                                        //         .length
                                        //         .toString();
                                        DateTime orderDate = DateTime.parse(
                                            ongoingCtrl
                                                .allOngoingOrderViewMainList[
                                                    index]
                                                .orderDate);
                                        var item = ongoingCtrl
                                            .allOngoingOrderViewMainList[index];
                                        DateTime orderTime = DateTime.parse(
                                            '${item.orderDate} ${item.orderTime}');
                                        int slNumber = index + 1;
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(orderTime);
                                        Duration difference =
                                            _calculateTimeDifference(
                                                orderTime,
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .status);
                                        String formatTime(int time) {
                                          return time
                                              .toString()
                                              .padLeft(2, '0');
                                        }

                                        return InkWell(
                                          onTap: () {
                                            posCtrl.viewPosOrderByIdRes(
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .id);
                                            bottomBar(
                                                context,
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .id,
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .status,);
                                          },
                                          child: Container(
                                            height: AppScreenUtil()
                                                .screenHeight(29),
                                            width: AppScreenUtil()
                                                .screenWidth(990),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: userTableHeadColor,
                                                  width: 0.8),
                                              color: whiteColor,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(70),
                                                        child: Center(
                                                          child: Text(
                                                            slNumber.toString(),
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(90),
                                                        child: Center(
                                                          child: Text(
                                                            formattedDate,
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            '${ongoingCtrl.allOngoingOrderViewMainList[index].name}',
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .ordType,
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(90),
                                                        child: Center(
                                                          child: Text(
                                                            ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .customerName,
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(90),
                                                        child: Center(
                                                          child: Text(
                                                            ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .amtTotal
                                                                .toString(),
                                                            style:
                                                                backTextStyle,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(120),
                                                        child: Center(
                                                            child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            1),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        30),
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        19),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: difference.inHours % 3600 > 1
                                                                          ? confirmColor
                                                                          : difference.inMinutes % 60 > 30
                                                                              ? ongoingYellowColor
                                                                              : userPostColor,
                                                                      width: 1.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.5),
                                                                  color:
                                                                      whiteColor,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    formatTime(
                                                                        difference.inHours %
                                                                            3600),
                                                                    style:
                                                                        backTextStyle,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )),
                                                            SizedBox(
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      3),
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            1),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        30),
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        19),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: difference.inHours % 3600 > 1
                                                                          ? confirmColor
                                                                          : difference.inMinutes % 60 > 30
                                                                              ? ongoingYellowColor
                                                                              : userPostColor,
                                                                      width: 1.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.5),
                                                                  color:
                                                                      whiteColor,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    formatTime(
                                                                        difference.inMinutes %
                                                                            60),
                                                                    style:
                                                                        backTextStyle,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )),
                                                            SizedBox(
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      3),
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            1),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        30),
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        19),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: difference.inHours % 3600 > 1
                                                                          ? confirmColor
                                                                          : difference.inMinutes % 60 > 30
                                                                              ? ongoingYellowColor
                                                                              : userPostColor,
                                                                      width: 1.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.5),
                                                                  color:
                                                                      whiteColor,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    formatTime(
                                                                        difference.inSeconds %
                                                                            60),
                                                                    style:
                                                                        backTextStyle,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )),
                                                          ],
                                                        )),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          1),
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      17),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color:
                                                                          userPendingColor,
                                                                      width:
                                                                          1.2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                  color:
                                                                      whiteColor),
                                                              child: Center(
                                                                child: Text(
                                                                  ongoingCtrl.allOngoingOrderViewMainList[index]
                                                                              .waiterName ==
                                                                          null
                                                                      ? '-NIL'
                                                                      : '${ongoingCtrl.allOngoingOrderViewMainList[index].waiterName}',
                                                                  style:
                                                                      backTextStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        width: AppScreenUtil()
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          1),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      53),
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      18),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: ongoingCtrl
                                                                              .allOngoingOrderViewMainList[index]
                                                                              .status ==
                                                                          'CHDRAFT'
                                                                      ? ongoingYellowColor
                                                                      : preparationDraftButtonColor),
                                                              child: Center(
                                                                child: Text(
                                                                  ongoingCtrl.allOngoingOrderViewMainList[index].status ==
                                                                          'CHDRAFT'
                                                                      ? 'Booking'
                                                                      : ongoingCtrl
                                                                          .allOngoingOrderViewMainList[
                                                                              index]
                                                                          .status,
                                                                  style: pangramRegular(
                                                                      size: 8.0,
                                                                      color:
                                                                          constantWhite),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                    ],
                                  ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void bottomBar(
    BuildContext context,
    dynamic orderId,
    status,
  ) {
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
                    Obx(
                      () =>
                          (ongoingCtrl.isCancelOngoingOrderLoading.value ==
                                  true)
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      bottom: AppScreenUtil().screenHeight(3)),
                                  child: CircularProgressIndicator(
                                    color: confirmColor,
                                    strokeWidth: 3,
                                  ),
                                )
                              : Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        posCtrl.viewPosConfigurationSettingsResData
                                                    .cancelOrdAuth ==
                                                true
                                            ? showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder:
                                                          (context, setState) {
                                                    return Dialog(
                                                      alignment:
                                                          Alignment.center,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4), // Set border radius here
                                                      ),
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(18, 18,
                                                                  18, 15),
                                                          decoration: BoxDecoration(
                                                              color: whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  ClipOval(
                                                                    child:
                                                                        Container(
                                                                      width: 28,
                                                                      height:
                                                                          28,
                                                                      color:
                                                                          posSpecialItems1Color,
                                                                      child: Center(
                                                                          child: SvgPicture.asset(
                                                                        ImageCons
                                                                            .imgCartItemRemove,
                                                                        height:
                                                                            AppScreenUtil().screenHeight(10),
                                                                      )),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: AppScreenUtil()
                                                                        .screenHeight(
                                                                            21),
                                                                  ),
                                                                  Text(
                                                                    'Cancel Order',
                                                                    style: pangramMedium(
                                                                        size:
                                                                            10.0,
                                                                        color:
                                                                            blackColor),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        12,
                                                                        10,
                                                                        23),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Enter Password',
                                                                      style: pangramRegular(
                                                                          size:
                                                                              10.0,
                                                                          color:
                                                                              blackColor),
                                                                    ),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              4),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          right:
                                                                              8),
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              32),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              3),
                                                                          border: Border.all(
                                                                              color: confirmColor.withOpacity(0.5),
                                                                              width: 0.8)),
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                AppScreenUtil().screenHeight(32),
                                                                            width:
                                                                                AppScreenUtil().screenWidth(60),
                                                                            color:
                                                                                posSpecialItems1Color,
                                                                            child: Center(
                                                                                child: SvgPicture.asset(
                                                                              ImageCons.imgCartItemRemove,
                                                                              height: AppScreenUtil().screenHeight(10),
                                                                            )),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                TextField(
                                                                              textAlign: TextAlign.right,
                                                                              maxLines: 1,
                                                                              obscureText: true,
                                                                              style: detailHeadTextStyle,
                                                                              controller: updatePasswordController,
                                                                              onChanged: (value) {
                                                                                // Remove error message when the user types something
                                                                                setState(() {
                                                                                  passwordErrorMessage = '';
                                                                                });
                                                                              },
                                                                              decoration: InputDecoration(
                                                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                                contentPadding: const EdgeInsets.only(bottom: 8, right: 3),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              2),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child:
                                                                          Text(
                                                                        passwordErrorMessage,
                                                                        style: pangramRegular(
                                                                            size:
                                                                                8.0,
                                                                            color:
                                                                                confirmColor),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            10),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            AppScreenUtil().screenHeight(22),
                                                                        width: AppScreenUtil()
                                                                            .screenWidth(45),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(3),
                                                                            border: Border.all(color: blackColor, width: 0.7)),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            'Cancel',
                                                                            style:
                                                                                kotDarkModeUnselectedTabLabelStyle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: AppScreenUtil()
                                                                          .screenWidth(
                                                                              5),
                                                                    ),
                                                                    Obx(() => (ongoingCtrl.isCancelOngoingOrderLoading.value ==
                                                                            true)
                                                                        ? Padding(
                                                                            padding:
                                                                                EdgeInsets.only(bottom: AppScreenUtil().screenHeight(3)),
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: confirmColor,
                                                                              strokeWidth: 3,
                                                                            ),
                                                                          )
                                                                        : GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              if (updatePasswordController.text.isEmpty) {
                                                                                setState(() {
                                                                                  passwordErrorMessage = "Please enter a valid password";
                                                                                });
                                                                              } else {
                                                                                confirmCancelOrder(context, orderId, status);
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: AppScreenUtil().screenHeight(22),
                                                                              width: AppScreenUtil().screenWidth(91),
                                                                              decoration: BoxDecoration(
                                                                                color: confirmColor,
                                                                                borderRadius: BorderRadius.circular(3),
                                                                                // border: Border.all(color: blackColor,width: 1)
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Submit',
                                                                                  style: pangramMedium(size: 10.0, color: whiteColor),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ))
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        8),
                                                              ),
                                                            ],
                                                          )),
                                                    );
                                                  });
                                                },
                                              )
                                            : confirmCancelOrder(
                                                context, orderId, status);
                                      },
                                      child: Container(
                                        width: AppScreenUtil().screenWidth(52),
                                        height:
                                            AppScreenUtil().screenHeight(52),
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
                                          width: 21,
                                          height: 17.5,
                                        )),
                                      ),
                                    ),
                                    // SizedBox(height: AppScreenUtil().screenHeight(2)),
                                    Text(
                                      'Cancel',
                                      style: userBottomBarTextStyle,
                                    ),
                                  ],
                                ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            posCtrl.viewPosOrderByIdRes(orderId);
                            if (status == 'DRAFT' ||
                                posCtrl.viewPosOrderByIdResData.orderInfo!
                                    .isNotEmpty) {
                                      posCtrl.productOrderId.value =
                                  orderId;
                                   posCtrl.customerId.value ='${posCtrl.viewPosOrderByIdResData.cusId}';
                              widget.voidFunction('$orderId',
                                  posCtrl.viewPosOrderByIdResData.orderInfo!);
                            } else {
                              posCtrl.productOrderId.value =
                                  orderId; // Assigning the string directly to the .value
                                  posCtrl.customerId.value ='${posCtrl.viewPosOrderByIdResData.cusId}';
                              print(
                                  '<<<OrderId From Ongoing Orders From CHDRAFT: $orderId');
                              print(
                                  '<<<OrderId From Ongoing Orders From CHDRAFT: ${posCtrl.productOrderId.value}>>>');

                              posCtrl.isAddOrderFromChDraftTapped.value = true;
                              widget.tappedCategoryItem = 'Home';
                              print(
                                  'Tapped Update: ${widget.tappedCategoryItem},Tapped: ${posCtrl.isAddOrderFromChDraftTapped.value}');
                            }
                          },
                          child: Container(
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
                              ImageCons.imgUpdateOrder,
                              width: 17.5,
                              height: 16.5,
                            )),
                          ),
                        ),
                        // SizedBox(height: AppScreenUtil().screenHeight(2)),
                        Text(
                          'Update Order',
                          style: userBottomBarTextStyle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.of(context).pop();
                            posCtrl.viewPosOrderByIdRes(orderId);
                            if (status == 'DRAFT' ||
                                posCtrl.viewPosOrderByIdResData.orderInfo!
                                    .isNotEmpty) {
                                      posCtrl.productOrderId.value =
                                  orderId;
                              widget.payment(orderId,true);
                            } else {
                              dispose();
                              posCtrl.productOrderId.value =
                                  orderId; // Assigning the string directly to the .value
                              // print(
                              //     '<<<OrderId From Ongoing Orders From CHDRAFT: $orderId');
                              // print(
                              //     '<<<OrderId From Ongoing Orders From CHDRAFT: ${posCtrl.productOrderId.value}>>>');

                              // posCtrl.isAddOrderFromChDraftTapped.value = true;
                              // widget.tappedCategoryItem = 'Home';
                              // print(
                              //     'Tapped Update: ${widget.tappedCategoryItem},Tapped: ${posCtrl.isAddOrderFromChDraftTapped.value}');
                            }
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
                              ImageCons.imgPaymentBottom,
                              width: 15.29,
                              height: 14.5,color: status == 'DRAFT'?blackColor:blackColor.withOpacity(0.3),
                            )),
                          ),
                          // SizedBox(height: AppScreenUtil().screenHeight(2)),
                          Text(
                            'Payment',
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

  void confirmCancelOrder(BuildContext context, String? orderId, status) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 20, 18, 25),
                    width: AppScreenUtil().screenWidth(226),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageCons.orderCancel,
                          height: AppScreenUtil().screenHeight(45),
                          width: AppScreenUtil().screenWidth(45),
                          color: loanDetailsThirdContainerColor,
                        ),
                        SizedBox(height: AppScreenUtil().screenHeight(10)),
                        Text(
                          'Confirm to cancel this order',
                          style: pangramMedium(size: 12.0, color: blackColor),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CustomButton(
                                buttonHeight: AppScreenUtil().screenHeight(30),
                                buttonWidth: AppScreenUtil().screenWidth(70),
                                buttonColor: lineThroughTextColor,
                                borderRadius: 4,
                                buttonText: 'Back',
                                buttonLabelStyle: pangramMedium(
                                    size: 10.0, color: constantWhite),
                              ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(10),
                            ),
                            GestureDetector(
                              onTap: () {
                                status == 'CHDRAFT'
                                    ? ongoingCtrl
                                        .cancelBookingOrderFromOngoingOrders(
                                            orderId,
                                            updatePasswordController.text)
                                        .then((value) {
                                        if (value == true) {
                                          setState(() {
                                            updatePasswordController.text = '';
                                          });
                                          ongoingCtrl
                                              .getAllOngoingOrdersList(1);
                                          // ongoingCtrl.ongoingOrderCount.value =
                                          //     ongoingCtrl
                                          //         .allOngoingOrderViewMainList
                                          //         .length
                                          //         .toString();
                                          AppUtils.oneTimeSnackBar(
                                              'Order Cancelled',
                                              bgColor: payButtonColor);
                                          posCtrl.viewPosConfigurationSettingsResData
                                                      .cancelOrdAuth ==
                                                  true
                                              ? Navigator.pop(context)
                                              : dispose;
                                          Navigator.of(context).pop();
                                          print(
                                              'Booking Cancelled Order :$orderId');
                                        } else {
                                          setState(() {
                                            updatePasswordController.text = '';
                                            passwordErrorMessage =
                                                'AUTHENTICATION FAILED - INVALID PASSWORD';
                                          });
                                          print('Booking Not cancelled');
                                          Navigator.of(context).pop();
                                        }
                                      })
                                    : ongoingCtrl
                                        .cancelOrderFromOngoingOrders(orderId,
                                            updatePasswordController.text)
                                        .then((value) {
                                        if (value == true) {
                                          setState(() {
                                            updatePasswordController.text = '';
                                          });
                                          ongoingCtrl
                                              .getAllOngoingOrdersList(1);
                                          // ongoingCtrl.ongoingOrderCount.value =
                                          //     ongoingCtrl
                                          //         .allOngoingOrderViewMainList
                                          //         .length
                                          //         .toString();
                                          posCtrl.viewPosConfigurationSettingsResData
                                                      .cancelOrdAuth ==
                                                  true
                                              ? Navigator.pop(context)
                                              : false;
                                          Navigator.pop(context);
                                          AppUtils.oneTimeSnackBar(
                                              'Order Cancelled',
                                              bgColor: payButtonColor);
                                          print('Cancelled Order :$orderId');
                                        } else {
                                          setState(() {
                                            updatePasswordController.text = '';
                                            passwordErrorMessage =
                                                'AUTHENTICATION FAILED - INVALID PASSWORD';
                                          });
                                          print('Not cancelled');
                                          Navigator.of(context).pop();
                                        }
                                      });
                              },
                              child: CustomButton(
                                buttonHeight: AppScreenUtil().screenHeight(30),
                                buttonWidth: AppScreenUtil().screenWidth(80),
                                buttonColor: confirmColor,
                                borderRadius: 4,
                                buttonText: 'Confirm',
                                buttonLabelStyle: pangramMedium(
                                    size: 10.0, color: constantWhite),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
