// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/presentation/user_app/features/home/controller/home_controller.dart';
import 'package:restaurant/presentation/user_app/widgets/custom_button.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';

class OngoingOrdersGrid extends StatefulWidget {
  final void Function(String, List<dynamic>) voidFunction;
  final void Function(String, bool) payment;
  dynamic tappedCategoryItem;
  OngoingOrdersGrid(String tappedCategoryItem,
      {super.key, required this.voidFunction, required this.payment});

  @override
  State<OngoingOrdersGrid> createState() => _OngoingOrdersGridState();
}

class _OngoingOrdersGridState extends State<OngoingOrdersGrid> {
  final updatePasswordController = TextEditingController();
  String passwordErrorMessage = '';
  List<Color> tableDataAlternateColor = [
    Colors.blue.withOpacity(0.35),
    Colors.pink.withOpacity(0.35),
    Colors.orange.withOpacity(0.35)
  ];

  ///API
  final ongoingCtrl = Get.find<OngoingOrdersController>();
  final homeCtrl = Get.find<HomeController>();
  final posCtrl = Get.find<POSController>();
  DateTime _currentTime = DateTime.now();
  late Timer _timer;
  bool _isVisible = true;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        _isVisible = !_isVisible;
      });
    });
  }

  Duration _calculateTimeDifference(DateTime orderTime, status) {
    return _currentTime
        .difference(status == 'CHDRAFT' ? DateTime.now() : orderTime);
  }

  String currencySymbol = '';
  String currencyId = '';
  Future<void> currency() async {
    currencyId = await AppUtils.getCurrencyId();
  }

  @override
  void initState() {
    homeCtrl.getAllCurrencyList();
    ongoingCtrl.getAllOngoingOrdersList(1);
    posCtrl.getProductListForPOS('', '');
    posCtrl.viewPosConfigurationSettings();
    print(
        'POS ConfigurationSettings for Cancel Order: ${posCtrl.viewPosConfigurationSettingsResData.cancelOrdAuth}');
    _startTimer();
    currency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, bottom: 30, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => (ongoingCtrl.allOngoingOrdersLoading.value == true)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: confirmColor,
                      ),
                    ),
                  )
                : (ongoingCtrl.isAllOngoingOrdersListError.value == true)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: const Center(child: EmptyLayout()))
                    : (ongoingCtrl.allOngoingOrderViewMainList.isEmpty)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Center(
                                child: Text(
                              'No Order Found',
                              style: bookedTextStyle,
                            )))
                        : Flexible(
                            fit: FlexFit.loose,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 25,
                                      childAspectRatio: 3 / 1.99),
                              itemCount: ongoingCtrl
                                  .allOngoingOrderViewMainList.length,
                              itemBuilder: (BuildContext context, int index) {
                                // ongoingCtrl.ongoingOrderCount.value =
                                //     ongoingCtrl
                                //         .allOngoingOrderViewMainList.length
                                //         .toString();

                                for (var id
                                    in homeCtrl.allCurrencyViewMainList) {
                                  if (id.id == currencyId) {
                                    currencySymbol = id.symbol.toString();
                                    // print(
                                    //     'CurrencyId From List : ${id.id.toString()}');
                                    // print('CurrencyId Stored: $currencyId');
                                  }
                                }
                                String timeString =
                                    '${ongoingCtrl.allOngoingOrderViewMainList[index].orderTime}';
                                DateTime parsedTime = DateTime.parse(
                                    "${ongoingCtrl.allOngoingOrderViewMainList[index].orderDate} $timeString");
                                String period =
                                    parsedTime.hour < 12 ? 'AM' : 'PM';
                                // Extract hour and minute
                                String formatTime(int time) {
                                  return time.toString().padLeft(2, '0');
                                }

                                int hour = parsedTime.hour > 12
                                    ? parsedTime.hour - 12
                                    : parsedTime.hour;
                                int minute = parsedTime.minute;
                                var item = ongoingCtrl
                                    .allOngoingOrderViewMainList[index];
                                DateTime orderTime = DateTime.parse(
                                    '${item.orderDate} ${item.orderTime}');
                                Duration difference = _calculateTimeDifference(
                                    orderTime,
                                    ongoingCtrl
                                        .allOngoingOrderViewMainList[index]
                                        .status);

                                return InkWell(
                                  onTap: () {
                                    posCtrl.viewPosOrderByIdRes(ongoingCtrl
                                        .allOngoingOrderViewMainList[index].id);
                                    bottomBar(
                                        context,
                                        ongoingCtrl
                                            .allOngoingOrderViewMainList[index]
                                            .id,
                                        ongoingCtrl
                                            .allOngoingOrderViewMainList[index]
                                            .status);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: ongoingCtrl
                                                  .allOngoingOrderViewMainList[
                                                      index]
                                                  .status ==
                                              'CHDRAFT'
                                          ? shiftContainerColor.withOpacity(0.8)
                                          : difference.inHours % 3600 > 1
                                              ? ongoingRedBackgroundColor
                                              : difference.inMinutes % 60 > 30
                                                  ? ongoingYellowBackgroundColor
                                                  : ongoingGreenBackgroundColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              ongoingOrdersGridBoxShadowColor,
                                          offset: Offset(0, 0),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 16),
                                          height:
                                              AppScreenUtil().screenHeight(25),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: ongoingCtrl
                                                        .allOngoingOrderViewMainList[
                                                            index]
                                                        .status ==
                                                    'CHDRAFT'
                                                ? addNoteColor.withOpacity(0.5)
                                                : difference.inHours % 3600 > 1
                                                    ? confirmColor
                                                    : difference.inMinutes %
                                                                60 >
                                                            30
                                                        ? ongoingYellowColor
                                                        : ongoingOrdersGridGreenColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(14),
                                                topRight: Radius.circular(14)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .orderDate,
                                                style: pangramMedium(
                                                    size: 13.0,
                                                    color: whiteColor),
                                              ),
                                              Text(
                                                '${formatTime(hour)}:${formatTime(minute)} $period',
                                                style: pangramMedium(
                                                    size: 13.0,
                                                    color: whiteColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(8),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 18),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Transform.translate(
                                                offset: Offset(0, 13),
                                                child: Text(
                                                  '${ongoingCtrl.allOngoingOrderViewMainList[index].name}',
                                                  style: pangramMedium(
                                                      size: 14.0,
                                                      color: blackColor),
                                                ),
                                              ),
                                              Transform.translate(
                                                offset: Offset(0, 13),
                                                child: ongoingCtrl
                                                            .allOngoingOrderViewMainList[
                                                                index]
                                                            .tableNames!
                                                            .isEmpty &&
                                                        ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .aggregatorName !=
                                                            null
                                                    ? Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                Offset(0, 2),
                                                            child: SvgPicture
                                                                .asset(
                                                              ImageCons
                                                                  .imgCartAggregators,
                                                              color: blackColor,
                                                              height: 20,
                                                              width: 22,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        5),
                                                          ),
                                                          Text(
                                                            ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .aggregatorName,
                                                            style: pangramMedium(
                                                                size: 16.0,
                                                                color:
                                                                    blackColor),
                                                          )
                                                        ],
                                                      )
                                                    : Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Transform.translate(
                                                            offset:
                                                                Offset(0, -6),
                                                            child: SvgPicture
                                                                .asset(
                                                              ImageCons
                                                                  .ongoingOrderTable,
                                                              height: 34,
                                                              width: 26,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        12),
                                                          ),
                                                          Text(
                                                            ongoingCtrl
                                                                    .allOngoingOrderViewMainList[
                                                                        index]
                                                                    .tableNames!
                                                                    .isEmpty
                                                                ? '-NIL'
                                                                : '${ongoingCtrl.allOngoingOrderViewMainList[index].tableNames!}/CH${ongoingCtrl.allOngoingOrderViewMainList[index].chairId!.length}',
                                                            style: pangramMedium(
                                                                size: 15.0,
                                                                color:
                                                                    blackColor),
                                                          )
                                                        ],
                                                      ),
                                              ),
                                              Column(
                                                children: [
                                                  Transform.translate(
                                                    offset: Offset(1.2, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'H',
                                                          style: pangramMedium(
                                                              size: 15.0,
                                                              color: ongoingCtrl
                                                                          .allOngoingOrderViewMainList[
                                                                              index]
                                                                          .status ==
                                                                      'CHDRAFT'
                                                                  ? blackColor
                                                                  : difference.inHours %
                                                                              3600 >
                                                                          1
                                                                      ? confirmColor
                                                                      : difference.inMinutes % 60 >
                                                                              30
                                                                          ? ongoingYellowColor
                                                                          : userPostColor),
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenWidth(10),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ongoingCtrl
                                                                        .allOngoingOrderViewMainList[
                                                                            index]
                                                                        .status ==
                                                                    'CHDRAFT'
                                                                ? addNoteColor
                                                                    .withOpacity(
                                                                        0.5)
                                                                : difference.inHours %
                                                                            3600 >
                                                                        1
                                                                    ? confirmColor
                                                                    : difference.inMinutes %
                                                                                60 >
                                                                            30
                                                                        ? ongoingYellowColor
                                                                        : userPostColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(6),
                                                              bottomLeft: Radius
                                                                  .circular(6),
                                                            ),
                                                          ),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      28),
                                                          width: AppScreenUtil()
                                                              .screenWidth(33),
                                                          child: Center(
                                                            child:
                                                                AnimatedOpacity(
                                                              opacity: _isVisible ||
                                                                      difference.inHours %
                                                                              3600 >
                                                                          1 ||
                                                                      ongoingCtrl
                                                                              .allOngoingOrderViewMainList[
                                                                                  index]
                                                                              .status ==
                                                                          'CHDRAFT' ||
                                                                      difference.inHours %
                                                                              3600 ==
                                                                          00
                                                                  ? 1.0
                                                                  : 0.0,
                                                              duration:
                                                                  Duration(
                                                                microseconds:
                                                                    250,
                                                              ),
                                                              child: Text(
                                                                formatTime(
                                                                    difference
                                                                            .inHours %
                                                                        3600),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      13.5,
                                                                  color:
                                                                      whiteColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(3),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(-0.2, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'M',
                                                          style: pangramMedium(
                                                              size: 14.0,
                                                              color: ongoingCtrl
                                                                          .allOngoingOrderViewMainList[
                                                                              index]
                                                                          .status ==
                                                                      'CHDRAFT'
                                                                  ? blackColor
                                                                  : difference.inHours %
                                                                              3600 >
                                                                          1
                                                                      ? confirmColor
                                                                      : difference.inMinutes % 60 >
                                                                              30
                                                                          ? ongoingYellowColor
                                                                          : userPostColor),
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenWidth(9),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ongoingCtrl
                                                                        .allOngoingOrderViewMainList[
                                                                            index]
                                                                        .status ==
                                                                    'CHDRAFT'
                                                                ? addNoteColor
                                                                    .withOpacity(
                                                                        0.5)
                                                                : difference.inHours %
                                                                            3600 >
                                                                        1
                                                                    ? confirmColor
                                                                    : difference.inMinutes %
                                                                                60 >
                                                                            30
                                                                        ? ongoingYellowColor
                                                                        : userPostColor,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        6),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        6)),
                                                          ),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      28),
                                                          width: AppScreenUtil()
                                                              .screenWidth(33),
                                                          child: Center(
                                                            child:
                                                                AnimatedOpacity(
                                                              opacity: _isVisible ||
                                                                      difference.inMinutes %
                                                                              60 >
                                                                          30 ||
                                                                      ongoingCtrl
                                                                              .allOngoingOrderViewMainList[index]
                                                                              .status ==
                                                                          'CHDRAFT'
                                                                  ? 1.0
                                                                  : 0.0,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      250),
                                                              child: Text(
                                                                formatTime(
                                                                    difference
                                                                            .inMinutes %
                                                                        60),
                                                                style: pangramMedium(
                                                                    size: 13.5,
                                                                    color:
                                                                        whiteColor),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(3),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(1.4, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'S',
                                                          style: pangramMedium(
                                                              size: 15.0,
                                                              color: ongoingCtrl
                                                                          .allOngoingOrderViewMainList[
                                                                              index]
                                                                          .status ==
                                                                      'CHDRAFT'
                                                                  ? blackColor
                                                                  : difference.inHours %
                                                                              3600 >
                                                                          1
                                                                      ? confirmColor
                                                                      : difference.inMinutes % 60 >
                                                                              30
                                                                          ? ongoingYellowColor
                                                                          : userPostColor),
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenWidth(10),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ongoingCtrl
                                                                        .allOngoingOrderViewMainList[
                                                                            index]
                                                                        .status ==
                                                                    'CHDRAFT'
                                                                ? addNoteColor
                                                                    .withOpacity(
                                                                        0.5)
                                                                : difference.inHours %
                                                                            3600 >
                                                                        1
                                                                    ? confirmColor
                                                                    : difference.inMinutes %
                                                                                60 >
                                                                            30
                                                                        ? ongoingYellowColor
                                                                        : userPostColor,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        6),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        6)),
                                                          ),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      28),
                                                          width: AppScreenUtil()
                                                              .screenWidth(33),
                                                          child: Center(
                                                            child:
                                                                AnimatedOpacity(
                                                              opacity: _isVisible ||
                                                                      ongoingCtrl
                                                                              .allOngoingOrderViewMainList[index]
                                                                              .status ==
                                                                          'CHDRAFT'
                                                                  ? 1.0
                                                                  : 0.0,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      250),
                                                              child: Text(
                                                                formatTime(
                                                                    difference
                                                                            .inSeconds %
                                                                        60),
                                                                style: pangramMedium(
                                                                    size: 13.5,
                                                                    color:
                                                                        whiteColor),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(20, -42),
                                          child: Container(
                                            height: AppScreenUtil()
                                                .screenHeight(30),
                                            width: AppScreenUtil()
                                                .screenWidth(111),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .status ==
                                                            'CHDRAFT'
                                                        ? addNoteColor
                                                            .withOpacity(0.5)
                                                        : difference.inHours %
                                                                    3600 >
                                                                1
                                                            ? confirmColor
                                                            : difference.inMinutes %
                                                                        60 >
                                                                    30
                                                                ? ongoingYellowColor
                                                                : userPostColor)),
                                            child: Center(
                                              child: Text(
                                                ongoingCtrl
                                                    .allOngoingOrderViewMainList[
                                                        index]
                                                    .customerName,
                                                style: pangramMedium(
                                                    size: 13.0,
                                                    color: blackColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Transform.translate(
                                              offset: Offset(20, -17),
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(30),
                                                width: AppScreenUtil()
                                                    .screenHeight(74),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: ongoingCtrl
                                                              .allOngoingOrderViewMainList[
                                                                  index]
                                                              .status ==
                                                          'CHDRAFT'
                                                      ? addNoteColor
                                                          .withOpacity(0.5)
                                                      : difference.inHours %
                                                                  3600 >
                                                              1
                                                          ? confirmColor
                                                          : difference.inMinutes %
                                                                      60 >
                                                                  30
                                                              ? ongoingYellowColor
                                                              : userPostColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .waiterName ==
                                                            null
                                                        ? '-NIL-'
                                                        : '${ongoingCtrl.allOngoingOrderViewMainList[index].waiterName}',
                                                    style: pangramMedium(
                                                        size: 13.0,
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(-20, -17),
                                              child: Container(
                                                height: AppScreenUtil()
                                                    .screenHeight(30),
                                                width: AppScreenUtil()
                                                    .screenHeight(115),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: ongoingCtrl
                                                              .allOngoingOrderViewMainList[
                                                                  index]
                                                              .status ==
                                                          'CHDRAFT'
                                                      ? addNoteColor
                                                          .withOpacity(0.5)
                                                      : difference.inHours %
                                                                  3600 >
                                                              1
                                                          ? confirmColor
                                                          : difference.inMinutes %
                                                                      60 >
                                                                  30
                                                              ? ongoingYellowColor
                                                              : userPostColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '\$ ${ongoingCtrl.allOngoingOrderViewMainList[index].amtTotal.toStringAsFixed(2)}',
                                                    style: pangramMedium(
                                                        size: 13.0,
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ))
          ],
        ));
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
                                      posCtrl.customerId.value ='${posCtrl.viewPosOrderByIdResData.cusId}';
                              widget.voidFunction('$orderId',
                                  posCtrl.viewPosOrderByIdResData.orderInfo!);
                              posCtrl.productOrderId.value = orderId;
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
                          posCtrl.productOrderId.value = orderId;
                          widget.payment(orderId, true);
                        } else {
                          dispose();
                          posCtrl.productOrderId.value = orderId;
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
                              height: 14.5,
                              color: status == 'DRAFT'
                                  ? blackColor
                                  : blackColor.withOpacity(0.3),
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
  