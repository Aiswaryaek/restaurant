import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/core/constants/colors.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../widgets/outlined_table.dart';
import '../../controller/currency_controller.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({super.key});

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  ScrollController currencyController = ScrollController();
  final currencyCtrl = Get.find<CurrencyController>();

  @override
  void initState() {
    currencyCtrl.getCurrencyList();
    super.initState();
  }

  List<String> currency = [
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD',
    'INR',
    'EUR',
    'USD',
    'INR',
  ];
  List<String> symbol = [
    '\$',
    '\$',
    '\$',
    '\$',
    '\$',
    '\$',
    '\$',
    '\$',
    '\$',
  ];
  List<String> name = [
    'Euro',
    'United States Dollar',
    'Indian Rupee',
    'Euro',
    'United States Dollar',
    'Indian Rupee',
    'Euro',
    'United States Dollar',
    'Indian Rupee',
  ];
  List<String> lastUpdate = [
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
    '12/03/2023',
  ];
  List<String> currencyRate = [
    '1,004567',
    '1000000',
    '79,5776765',
    '1,004567',
    '1000000',
    '79,5776765',
    '1,004567',
    '1000000',
    '79,5776765',
  ];
  List<bool> active = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => (currencyCtrl.currencyDetailsLoading.value == true)
        ? SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: const Center(
              child: CircularProgressIndicator(
                color: confirmColor,
              ),
            ),
          )
        : (currencyCtrl.isCurrencyListError.value == true)
            ? Padding(
                padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(50)),
                child: AppErrorScreen(
                  buttonOnTap: () {
                    currencyCtrl.getCurrencyList();
                  },
                ),
              )
            : (currencyCtrl.currencyDetailsMainList.isEmpty)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: const Center(child: EmptyLayout()))
                : RefreshIndicator(
                    color: confirmColor,
                    onRefresh: () {
                      return currencyCtrl.getCurrencyList();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 35),
                      child: Column(
                        children: [
                          OutLinedTable(
                              visible: false,
                              scrollController: currencyController,
                              tableHeight:
                                  MediaQuery.of(context).size.height / 2,
                              tableDataWidgets: List.generate(
                                  currencyCtrl.currencyDetailsMainList.length,
                                  (index) {
                                return InkWell(
                                  child: Container(
                                    height: AppScreenUtil().screenHeight(38),
                                    width: AppScreenUtil().screenWidth(650),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: searchTextColor
                                                .withOpacity(0.15)),
                                        color: Colors.transparent),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              AppScreenUtil().screenWidth(18)),

                                      ///scrolling row
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
                                                    currencyCtrl
                                                            .currencyDetailsMainList[
                                                                index]
                                                            .currencyCode ??
                                                        'N/A',
                                                    style:
                                                        tableSubTitleLabelStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                      currencyCtrl
                                                              .currencyDetailsMainList[
                                                                  index]
                                                              .symbol ??
                                                          'N/A',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                    .screenWidth(105),
                                                child: Center(
                                                  child: Text(
                                                      currencyCtrl
                                                              .currencyDetailsMainList[
                                                                  index]
                                                              .name ??
                                                          'N/A',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                    .screenWidth(110),
                                                child: Center(
                                                  child: Text(
                                                      (currencyCtrl
                                                                  .currencyDetailsMainList[
                                                                      index]
                                                                  .lastUpdatedDate !=
                                                              null)
                                                          ? currencyCtrl
                                                              .parseAndFormatDate(
                                                                  currencyCtrl
                                                                      .currencyDetailsMainList[
                                                                          index]
                                                                      .lastUpdatedDate!)
                                                          : 'N/A',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                                    .screenWidth(110),
                                                child: Center(
                                                  child: Text(
                                                      '${currencyCtrl.currencyDetailsMainList[index].currencyRate ?? 'N/A'}',
                                                      style:
                                                          tableSubTitleLabelStyle,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                              color: Colors.transparent,
                                              width: AppScreenUtil()
                                                  .screenWidth(95),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FlutterSwitch(
                                                    width: 43,
                                                    height: 18,
                                                    toggleSize: 11.0,
                                                    value: currencyCtrl
                                                        .currencyDetailsMainList[
                                                            index]
                                                        .status!,
                                                    borderRadius: 30.0,
                                                    padding: 2.0,
                                                    toggleColor: currencyCtrl
                                                                .currencyDetailsMainList[
                                                                    index]
                                                                .status ==
                                                            false
                                                        ? confirmColor
                                                        : greenColor,
                                                    switchBorder: Border.all(
                                                      color: currencyCtrl
                                                                  .currencyDetailsMainList[
                                                                      index]
                                                                  .status ==
                                                              false
                                                          ? confirmColor
                                                          : greenColor,
                                                      width: 1,
                                                    ),
                                                    toggleBorder: Border.all(
                                                      color: currencyCtrl
                                                                  .currencyDetailsMainList[
                                                                      index]
                                                                  .status ==
                                                              false
                                                          ? confirmColor
                                                          : greenColor,
                                                      width: 1,
                                                    ),
                                                    activeColor: whiteColor,
                                                    inactiveColor: whiteColor,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        active[index] = val;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    // bottomBar(context);
                                  },
                                );
                              }),
                              tableRowWidth: 650,
                              titleWidgets: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Currency',
                                        style: tableTitleLabelStyle,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Symbol',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(105),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Name',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Last Update',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Currency Rate',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(95),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Active',
                                          style: tableTitleLabelStyle,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                              ]),
                        ],
                      ),
                    ),
                  ));
  }
}
