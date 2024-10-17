// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/account_payable/create/account_payable.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';

class UserViewOrder extends StatefulWidget {
  final void Function(String, List<dynamic>) voidFunction;
  dynamic tappedCategoryItem;
  UserViewOrder(this.tappedCategoryItem,
      {super.key, required this.voidFunction});

  @override
  State<UserViewOrder> createState() => _UserViewOrderState();
}

class _UserViewOrderState extends State<UserViewOrder> {
  ///API
  final ongoingCtrl = Get.find<OngoingOrdersController>();
  final posCtrl = Get.find<POSController>();
  bool tappedDetail = false;

  @override
  void initState() {
    ongoingCtrl.getAllOngoingOrdersList(2);
    posCtrl.getProductListForPOS('', '');
    posCtrl.viewPosConfigurationSettings();
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
                                        width:
                                            AppScreenUtil().screenWidth(1360),
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
                                                        .screenWidth(120),
                                                    child: Center(
                                                      child: Text(
                                                        'Order No',
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
                                                        .screenWidth(100),
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
                                                        .screenWidth(100),
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
                                                        .screenWidth(140),
                                                    child: Center(
                                                      child: Text(
                                                        'Address',
                                                        style: userSubTextStyle,
                                                        // maxLines: 1,
                                                        overflow:
                                                            TextOverflow.fade,
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
                                                        'Aggregator',
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
                                                        'Referal',
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
                                                        .screenWidth(100),
                                                    child: Center(
                                                      child: Text(
                                                        'Balance',
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
                                        int slNumber = index + 1;
                                        var item = ongoingCtrl
                                            .allOngoingOrderViewMainList[index];
                                        DateTime orderTime = DateTime.parse(
                                            '${item.orderDate} ${item.orderTime}');
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy')
                                                .format(orderTime);
                                        return InkWell(
                                          child: Container(
                                            height: AppScreenUtil()
                                                .screenHeight(29),
                                            width: AppScreenUtil()
                                                .screenWidth(1360),
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
                                                            .screenWidth(120),
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
                                                            .screenWidth(100),
                                                        child: Center(
                                                          child: Text(
                                                            ongoingCtrl
                                                                .allOngoingOrderViewMainList[
                                                                    index]
                                                                .customerMobile,
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
                                                            .screenWidth(140),
                                                        child: Center(
                                                          child: Text(
                                                            ongoingCtrl
                                                                    .allOngoingOrderViewMainList[
                                                                        index]
                                                                    .custAddress
                                                                    .isEmpty
                                                                ? '-NIL-'
                                                                : [
                                                                    ongoingCtrl
                                                                            .allOngoingOrderViewMainList[index]
                                                                            .custAddress['street'] ??
                                                                        '',
                                                                    ongoingCtrl
                                                                            .allOngoingOrderViewMainList[index]
                                                                            .custAddress['city'] ??
                                                                        '',
                                                                    ongoingCtrl
                                                                            .allOngoingOrderViewMainList[index]
                                                                            .custAddress['buildingNo'] ??
                                                                        '',
                                                                    ongoingCtrl
                                                                            .allOngoingOrderViewMainList[index]
                                                                            .custAddress['roomNo'] ??
                                                                        '',
                                                                  ]
                                                                    .where((e) =>
                                                                        e.isNotEmpty)
                                                                    .join(', '),
                                                            style:
                                                                backTextStyle,
                                                            // maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                                    .aggregatorName ??
                                                                '-NIL-',
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
                                                                    .aggregatorRef ??
                                                                '-NIL-',
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
                                                                    .paidAmt
                                                                    .toStringAsFixed(
                                                                        2) ??
                                                                '0.0',
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
                                                                    .amountDue
                                                                    .toStringAsFixed(
                                                                        2) ??
                                                                '-NIL-',
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
                                                                    .waiterName ??
                                                                '-NIL-',
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
                                                  Container(
                                                      color: Colors.transparent,
                                                      width: AppScreenUtil()
                                                          .screenWidth(100),
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
                                                                      50),
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                color: ongoingCtrl
                                                                            .allOngoingOrderViewMainList[
                                                                                index]
                                                                            .status ==
                                                                        'CANCELLED'
                                                                    ? viewOrdersCancelButtonColor
                                                                    : ongoingCtrl.allOngoingOrderViewMainList[index].status ==
                                                                            'DONE'
                                                                        ? viewOrdersCompletedButtonColor
                                                                        : viewOrdersReturnButtonColor,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  ongoingCtrl.allOngoingOrderViewMainList[index].status ==
                                                                          'CANCELLED'
                                                                      ? 'Cancel'
                                                                      : ongoingCtrl.allOngoingOrderViewMainList[index].status ==
                                                                              'DONE'
                                                                          ? 'Completed'
                                                                          : 'Return',
                                                                  style: pangramMedium(
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
                                                              ))
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
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
                                                    .status,posCtrl.viewPosOrderByIdResData.cusId);
                                          },
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
    status, String? cusId,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            posCtrl.viewPosOrderByIdRes(orderId);
                            if (status == 'DONE' ||
                                status == 'RETURN' ||
                                posCtrl.viewPosOrderByIdResData.orderInfo!
                                    .isNotEmpty) {
                             
                             
                              widget.voidFunction('$orderId',
                                  posCtrl.viewPosOrderByIdResData.orderInfo!);
                                  setState(() {
                                    posCtrl.productOrderId.value = orderId;
                                  });
                                   print('<<<OrderId From View Orders: $orderId && ${posCtrl.productOrderId.value}>>>');
                            } else {
                              posCtrl.productOrderId.value =
                                  orderId; // Assigning the string directly to the .value
                              print('<<<OrderId From View Orders: $orderId>>>');
                              print(
                                  '<<<OrderId From View Orders: ${posCtrl.productOrderId.value}>>>');
                              widget.tappedCategoryItem = 'Home';
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
                              ImageCons.imgOrderRefund,
                              width: 19,
                              height: 19,
                              color: status == 'DONE' || status == 'RETURN'
                                  ? blackColor
                                  : blackColor.withOpacity(0.25),
                            )),
                          ),
                        ),
                        Text(
                          'Refund',
                          style: userBottomBarTextStyle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        print('Customer Id from Single View: ${posCtrl.viewPosOrderByIdResData.cusId}');
                       setState(() {
                          posCtrl.customerId.value='${posCtrl.viewPosOrderByIdResData.cusId}';
                          posCtrl.tappedCategoryItem.value = 'Home';
                          print('Tapped Category Item:   ${posCtrl.tappedCategoryItem.value}');
                       });
                        print('CustomerID: ${posCtrl.customerId.value}');
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
                              ImageCons.imgAddOrder,
                              width: 28,
                              height: 28,
                              color: blackColor,
                            )),
                          ),
                          // SizedBox(height: AppScreenUtil().screenHeight(2)),
                          Text(
                            'Add Order',
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
}