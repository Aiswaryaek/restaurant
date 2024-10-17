// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/sub_accounts.dart';
import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';

dynamic currentTab;

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  final customers = <ProductCategoriesModel>[];
  final vendors = <ProductCategoriesModel>[];
  final accounting = <ProductCategoriesModel>[];
  final reconciliation = <ProductCategoriesModel>[];
  final configuration = <ProductCategoriesModel>[];
  final partnerReport = <ProductCategoriesModel>[];
  final financialReports = <ProductCategoriesModel>[];
  final generalReports = <ProductCategoriesModel>[];
  final vatReport = <ProductCategoriesModel>[];
  int? tappedCustomers;
  int? tappedVendors;
  int? tappedAccounting;
  int? tappedReconciliation;
  int? tappedConfiguration;
  int? tappedPartnerReport;
  int? tappedFinancialReport;
  int? tappedGeneralReport;
  int? tappedVatReport;
  dynamic currentTab;
  String tappedCustomersHead = 'Customers';
  String tappedVendorsHead = 'Vendors';
  String tappedAccountingHead = 'Accounting';
  String tappedReconciliationHead = 'Reconciliation';
  String tappedConfigurationHead = 'Configuration';
  String tappedPartnerReportHead = 'Partner Reports';
  String tappedFinancialReportHead = 'Financial Reports';
  String tappedGeneralReportHead = 'General Reports';
  String tappedVatReportHead = 'VAT Report';
  dynamic item;

  @override
  void initState() {
    customers.add(ProductCategoriesModel(
        'Customer Invoices', ImageCons.imgCustomerInvoice));
    customers.add(ProductCategoriesModel('Sales W/SO', ImageCons.imgSalesWso));
    customers.add(ProductCategoriesModel('Payments', ImageCons.imgPayments));
    customers
        .add(ProductCategoriesModel('Credit Notes', ImageCons.imgCreditNotes));
    customers.add(ProductCategoriesModel('Customers', ImageCons.imgCustomers));
    vendors
        .add(ProductCategoriesModel('Vendor Bills', ImageCons.imgVendorBills));
    vendors
        .add(ProductCategoriesModel('Purchase W/PO', ImageCons.imgPurchaseWpo));
    vendors.add(ProductCategoriesModel(' Payments', ImageCons.imgPayments));
    vendors.add(ProductCategoriesModel('Debit Notes', ImageCons.imgDebitNotes));
    vendors.add(ProductCategoriesModel('Vendors', ImageCons.imgVendors));
    accounting.add(ProductCategoriesModel('Journals', ImageCons.imgJournal));
    accounting.add(ProductCategoriesModel(
        'Chart Of Accounts', ImageCons.imgChartOfAccounts));
    accounting.add(
        ProductCategoriesModel('Journal Entries', ImageCons.imgJournalEntries));
    accounting.add(ProductCategoriesModel(
        'Recurring Posting', ImageCons.imgRecurringPosting));
    reconciliation.add(ProductCategoriesModel(
        'Bank Reconciliation', ImageCons.imgBankReconciliation));
    reconciliation
        .add(ProductCategoriesModel('Journals', ImageCons.imgJournal));
    reconciliation
        .add(ProductCategoriesModel('Journals', ImageCons.imgJournal));
    reconciliation
        .add(ProductCategoriesModel('Journals', ImageCons.imgJournal));
    configuration.add(ProductCategoriesModel(
        'GL Configuration', ImageCons.imgGlConfiguration));
    partnerReport.add(
        ProductCategoriesModel('Account Payable', ImageCons.imgAccounting));
    partnerReport.add(ProductCategoriesModel('Accounts Receivable Aging Report',
        ImageCons.imgAccountPayableAgingReport));
    partnerReport.add(ProductCategoriesModel(
        'Account Receivable', ImageCons.imgAccountReceivable));
    partnerReport.add(ProductCategoriesModel('Accounts Payable Aging Report',
        ImageCons.imgAccountReceivableAgingReport));
    financialReports.add(
        ProductCategoriesModel('Trial Balance', ImageCons.imgTrailBalance));
    financialReports.add(
        ProductCategoriesModel('Balance Sheet', ImageCons.imgBalanceSheet));
    financialReports.add(
        ProductCategoriesModel('General Ledger', ImageCons.imgGeneralLedger));
    financialReports.add(ProductCategoriesModel(
        'Profit & Loss Report', ImageCons.imgProfitAndLoss));
    generalReports.add(ProductCategoriesModel(
        'Bank & Cash report', ImageCons.imgBankAndCashReport));
    generalReports.add(ProductCategoriesModel(
        'Invoice Margin Report', ImageCons.imgInvoiceMarginReport));
    generalReports.add(ProductCategoriesModel(
        'Product Margin Report', ImageCons.imgProductMarginReport));
    generalReports.add(ProductCategoriesModel(
        'Customer Receipt Report', ImageCons.imgCustomerReceiptReport));
    vatReport.add(ProductCategoriesModel(
        'Input / Output Report', ImageCons.imgInputOutput));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Customer Invoices' ||
            currentTab == 'Sales W/SO' ||
            currentTab == 'Credit Notes' ||
            currentTab == 'Customers' ||
            currentTab == 'Payments' ||
            currentTab == ' Payments' ||
            currentTab == 'Vendor Bills' ||
            currentTab == 'Debit Notes' ||
            currentTab == 'Vendors' ||
            currentTab == 'Journals' ||
            currentTab == 'Journal Entries' ||
            currentTab == 'Chart Of Accounts' ||
            currentTab == 'Recurring Posting' ||
            currentTab == 'Bank Reconciliation' ||
            currentTab == 'GL Configuration' ||
            currentTab == 'Account Payable' ||
            currentTab == 'Account Receivable' ||
            currentTab == 'Accounts Payable Aging Report' ||
            currentTab == 'Accounts Receivable Aging Report' ||
            currentTab == 'Trial Balance' ||
            currentTab == 'General Ledger' ||
            currentTab == 'Bank & Cash report' ||
            currentTab == 'Invoice Margin Report' ||
            currentTab == 'Product Margin Report' ||
            currentTab == 'Customer Receipt Report' ||
            currentTab == 'Balance Sheet' ||
            currentTab == 'Purchase W/PO' ||
            currentTab == 'Input / Output Report' ||
            currentTab == 'Profit & Loss Report'
        ? SubAccountsPage(currentTab, item)
        : Container(
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
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              children: [
                SizedBox(height: AppScreenUtil().screenHeight(25),),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.translate(
                          offset: Offset(0, -2),
                          child: Text(
                            'Accounts',
                            style: dashBoardLabelTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(12),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Customers', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(customers.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedCustomers = index;
                                  currentTab = customers[index].text;
                                  item = tappedCustomersHead;
                                });
                                print('Current Head: $tappedCustomersHead');
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                width: AppScreenUtil().screenWidth(80),
                                color: Colors.transparent,
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: customers[index].icon ==
                                              ImageCons.imgCustomers
                                          ? EdgeInsets.all(9.3)
                                          : EdgeInsets.all(11),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          customers[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Center(
                                      child: Text(
                                        customers[index].text.toString(),
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
                      Align(
                        alignment: Alignment.center,
                        child: Text('Vendors', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children:
                            List<Widget>.generate(vendors.length, (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedVendors = index;
                                  currentTab = vendors[index].text;
                                  item = tappedVendorsHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                width: AppScreenUtil().screenWidth(80),
                                color: Colors.transparent,
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:
                                          SvgPicture.asset(vendors[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Center(
                                      child: Text(
                                        vendors[index].text.toString(),
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
                      Align(
                        alignment: Alignment.center,
                        child: Text('Accounting', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(accounting.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedAccounting = index;
                                  currentTab = accounting[index].text;
                                  item = tappedAccountingHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(11),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          accounting[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      accounting[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Reconciliation', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(reconciliation.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedReconciliation = index;
                                  currentTab = reconciliation[index].text;
                                  item = tappedReconciliationHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.8),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          reconciliation[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      reconciliation[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('VAT Report', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(vatReport.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedVatReport = index;
                                  currentTab = vatReport[index].text;
                                  item = tappedVatReportHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.8),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          vatReport[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      vatReport[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Report', style: categoryTextStyle),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                      Text('Partner Reports', style: categoryTextStyle),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(10),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(partnerReport.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedPartnerReport = index;
                                  currentTab = partnerReport[index].text;
                                  item = tappedPartnerReportHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          partnerReport[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      partnerReport[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Text('Financial Reports', style: categoryTextStyle),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(10),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(financialReports.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedFinancialReport = index;
                                  currentTab = financialReports[index].text;
                                  item = tappedFinancialReportHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          financialReports[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      financialReports[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Text('General Reports', style: categoryTextStyle),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(10),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 13,
                        children: List<Widget>.generate(generalReports.length,
                            (int index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  tappedGeneralReport = index;
                                  currentTab = generalReports[index].text;
                                  item = tappedGeneralReportHead;
                                });
                                print('current Tab :$currentTab');
                              },
                              child: Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          generalReports[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      generalReports[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(20),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Configuration', style: categoryTextStyle),
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
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.5),
                                      height: AppScreenUtil().screenHeight(38),
                                      width: AppScreenUtil().screenWidth(47),
                                      decoration: BoxDecoration(
                                        color: tabSelectionAColor
                                            .withOpacity(0.20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                          configuration[index].icon),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(6),
                                    ),
                                    Text(
                                      configuration[index].text.toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: clearDataAlertYesButtonLabelStyle,
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(25),
                      ),
                    ],
                  ),
                ))
              ],
            ));
  }
}
