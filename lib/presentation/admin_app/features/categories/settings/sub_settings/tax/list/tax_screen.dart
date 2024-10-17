import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/presentation/admin_app/widgets/non_scrollable_table.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../widgets/outlined_table.dart';

class TaxListScreen extends StatefulWidget {
  const TaxListScreen({super.key});

  @override
  State<TaxListScreen> createState() => _TaxListScreenState();
}

class _TaxListScreenState extends State<TaxListScreen> {
  List<bool> taxSwitchValues = List.generate(8, (index) => false);
  ScrollController taxController = ScrollController();

  List<String> taxNameList = [
    'Sales VAT 5%',
    'Purchase VAT 0%',
    'Sales VAT 5%',
    'Purchase VAT 0%',
    'Sales VAT 5%',
    'Purchase VAT 0%',
    'Sales VAT 5%',
    'Purchase VAT 0%',
  ];
  List<String> taxScopeList = [
    'Goods',
    'Goods',
    'Goods',
    'Goods',
    'Goods',
    'Goods',
    'Goods',
    'Goods',
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
  List<Color> alternateStatusColor = [Colors.blue, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16,top: 8,bottom: 30),
          child: OutLinedTable(
              visible: false,
              scrollController: taxController,
              // tableHeight: MediaQuery.of(context).size.height / 2,
              tableDataWidgets: List.generate(taxNameList.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(38),
                    width: AppScreenUtil().screenWidth(325),
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
                                width: AppScreenUtil().screenWidth(95),
                                child: Center(
                                  child: Text(
                                    taxNameList[index],
                                    style: tableSubTitleLabelStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Center(
                                  child: Text(taxScopeList[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(95),
                                child: Center(
                                  child: FlutterSwitch(
                                    width: 43,
                                    height: 18,
                                    toggleSize: 11.0,
                                    value: active[index],
                                    borderRadius: 30.0,
                                    padding: 2.0,
                                    toggleColor: active[index]== false?confirmColor:greenColor,
                                    switchBorder: Border.all(
                                      color: active[index]== false?confirmColor:greenColor,
                                      width: 1,
                                    ),
                                    toggleBorder: Border.all(
                                      color: active[index]== false?confirmColor:greenColor,
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    // bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 325,
              titleWidgets: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Center(
                        child: Text(
                          'Tax Name',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Center(
                        child: Text(
                          'Tax Scope',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(95),
                      child: Center(
                        child: Text(
                          'Tax Scope',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}
