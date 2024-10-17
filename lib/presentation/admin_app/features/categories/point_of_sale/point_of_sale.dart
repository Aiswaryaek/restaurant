// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/sub_point_of_sale.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';

class PointOfSale extends StatefulWidget {
  const PointOfSale({super.key});

  @override
  State<PointOfSale> createState() => _PointOfSaleState();
}

class _PointOfSaleState extends State<PointOfSale> {
  final billing = <ProductCategoriesModel>[];
  final general = <ProductCategoriesModel>[];
  final reports = <ProductCategoriesModel>[];
  final reservation = <ProductCategoriesModel>[];
  final expense = <ProductCategoriesModel>[];
  final rewards = <ProductCategoriesModel>[];
  final offers = <ProductCategoriesModel>[];
  final configuration = <ProductCategoriesModel>[];
  dynamic currentTab;
  int? tappedBilling;
  int? tappedGeneral;
  int? tappedReports;
  int? tappedReservation;
  int? tappedExpense;
  int? tappedRewards;
  int? tappedOffers;
  int? tappedConfiguration;
  String tappedBillingHead = 'Billing';
  String tappedReportHead = 'Reports';
  String tappedGeneralHead = 'General';
  String tappedExpenseHead = 'Expenses';
  String tappedConfigurationHead = 'Configuration';

  dynamic item;

  @override
  void initState() {
    // billing.add(ProductCategoriesModel('Dashboard', ImageCons.imgPosDashBoard));
    billing.add(ProductCategoriesModel('Billing', ImageCons.imgBilling));
    billing.add(
        ProductCategoriesModel('Special Items', ImageCons.imgSpecialItems));
    // billing.add(ProductCategoriesModel('KOT Display', ImageCons.imgKotDisplay));
    general.add(ProductCategoriesModel('Shift', ImageCons.imgShift));
    general.add(ProductCategoriesModel('Orders', ImageCons.imgOrder));
    general.add(ProductCategoriesModel('Payment', ImageCons.imgPosPayment));
    general.add(ProductCategoriesModel('Wallet', ImageCons.imgWallet));
    reports.add(
        ProductCategoriesModel('Shift Report', ImageCons.imgPosShiftReport));
    reports.add(ProductCategoriesModel(
        'Shift Summary Report', ImageCons.imgPosSummaryReport));
    reports.add(
        ProductCategoriesModel('Sales Details', ImageCons.imgPosSalesDetails));
    reports.add(ProductCategoriesModel(
        'Daily Cash/Card Summary', ImageCons.imgCashOrCardSummary));
    expense.add(
        ProductCategoriesModel('Staff Expenses', ImageCons.imgStaffExpense));
    expense.add(
        ProductCategoriesModel('Outlet Expenses', ImageCons.imgOutletExpense));
    expense.add(ProductCategoriesModel(
        'Petty Cash Receipts', ImageCons.imgPettyCashReceipts));
    expense.add(ProductCategoriesModel(
        'Add Expense Type', ImageCons.imgAddExpenseType));
    configuration
        .add(ProductCategoriesModel('Settings', ImageCons.imgPosSettings));
    configuration.add(
        ProductCategoriesModel('Branch Settings', ImageCons.imgBranchSettings));
    configuration
        .add(ProductCategoriesModel('Aggregator', ImageCons.imgPosAggregators));
    // configuration.add(ProductCategoriesModel(
    //     'Floor Management', ImageCons.imgFloorManagement));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Billing' ||
            currentTab == 'Special Items' ||
            currentTab == 'Orders' ||
            currentTab == 'Payment' ||
            currentTab == 'Shift' ||
            currentTab == 'Wallet' ||
            currentTab == 'Staff Expenses' ||
            currentTab == 'Outlet Expenses' ||
            currentTab == 'Petty Cash Receipts' ||
            currentTab == 'Add Expense Type' ||
            currentTab == 'Settings' ||
            currentTab == 'Branch Settings' ||
            currentTab == 'Aggregator' ||
            currentTab == 'Shift Report' ||
            currentTab == 'Shift Summary Report' ||
            currentTab == 'Sales Details' ||
            currentTab == 'Daily Cash/Card Summary'
        ? SubPointOfSale(currentTab, item)
        : Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
            // height: 600,
            width: double.infinity,
            // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    tabPageLeftGradientColor,
                    tabPageRightGradientColor,
                  ]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppScreenUtil().screenHeight(25),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -2),
                          child: Text(
                            'Point Of Sale',
                            style: dashBoardLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(25),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 13,
                          children: List<Widget>.generate(billing.length,
                              (int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    tappedBilling = index;
                                    currentTab = billing[index].text;
                                    item = tappedBillingHead;
                                  });
                                  print('current Tab :$currentTab');
                                },
                                child: Container(
                                  width: AppScreenUtil().screenWidth(80),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(11),
                                        height:
                                            AppScreenUtil().screenHeight(38),
                                        width: AppScreenUtil().screenWidth(47),
                                        decoration: BoxDecoration(
                                          color: tabSelectionAColor
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                            billing[index].icon),
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Center(
                                        child: Text(
                                          billing[index].text.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style:
                                              clearDataAlertYesButtonLabelStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Center(
                          child: Text('General', style: categoryTextStyle),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 13,
                          children: List<Widget>.generate(general.length,
                              (int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    tappedGeneral = index;
                                    currentTab = general[index].text;
                                    item = tappedGeneralHead;
                                  });
                                  print('current Tab :$currentTab');
                                },
                                child: Container(
                                  width: AppScreenUtil().screenWidth(80),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(11),
                                        height:
                                            AppScreenUtil().screenHeight(38),
                                        width: AppScreenUtil().screenWidth(47),
                                        decoration: BoxDecoration(
                                          color: tabSelectionAColor
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                            general[index].icon),
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Center(
                                        child: Text(
                                          general[index].text.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style:
                                              clearDataAlertYesButtonLabelStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Center(
                          child: Text('Reports', style: categoryTextStyle),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 13,
                          children: List<Widget>.generate(reports.length,
                              (int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    tappedReports = index;
                                    currentTab = reports[index].text;
                                    item = tappedReportHead;
                                  });
                                  print('current Tab :$currentTab');
                                },
                                child: Container(
                                  width: AppScreenUtil().screenWidth(80),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(11),
                                        height:
                                            AppScreenUtil().screenHeight(38),
                                        width: AppScreenUtil().screenWidth(47),
                                        decoration: BoxDecoration(
                                          color: tabSelectionAColor
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                            reports[index].icon),
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Center(
                                        child: Text(
                                          reports[index].text.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style:
                                              clearDataAlertYesButtonLabelStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Center(
                          child: Text('Expenses', style: categoryTextStyle),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 13,
                          children: List<Widget>.generate(expense.length,
                              (int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    tappedExpense = index;
                                    currentTab = expense[index].text;
                                    item = tappedExpenseHead;
                                  });
                                  print('current Tab :$currentTab');
                                },
                                child: Container(
                                  width: AppScreenUtil().screenWidth(80),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(11),
                                        height:
                                            AppScreenUtil().screenHeight(38),
                                        width: AppScreenUtil().screenWidth(47),
                                        decoration: BoxDecoration(
                                          color: tabSelectionAColor
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                            expense[index].icon),
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Center(
                                        child: Text(
                                          expense[index].text.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style:
                                              clearDataAlertYesButtonLabelStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Center(
                          child: Text(tappedConfigurationHead,
                              style: categoryTextStyle),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 13,
                          children: List<Widget>.generate(configuration.length,
                              (int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    tappedConfiguration = index;
                                    currentTab = configuration[index].text;
                                    item = tappedConfigurationHead;
                                  });
                                  print('current Tab :$currentTab');
                                },
                                child: Container(
                                  width: AppScreenUtil().screenWidth(80),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(11),
                                        height:
                                            AppScreenUtil().screenHeight(38),
                                        width: AppScreenUtil().screenWidth(47),
                                        decoration: BoxDecoration(
                                          color: tabSelectionAColor
                                              .withOpacity(0.20),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                            configuration[index].icon),
                                      ),
                                      SizedBox(
                                        height: AppScreenUtil().screenHeight(6),
                                      ),
                                      Center(
                                        child: Text(
                                          configuration[index].text.toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style:
                                              clearDataAlertYesButtonLabelStyle,
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(50),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
