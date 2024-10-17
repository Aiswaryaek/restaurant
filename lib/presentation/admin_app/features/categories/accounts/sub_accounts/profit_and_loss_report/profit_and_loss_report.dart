import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/profit_and_loss_expansion_table_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/single_row_table_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ProfitAndLossReport extends StatefulWidget {
  const ProfitAndLossReport({super.key});

  @override
  State<ProfitAndLossReport> createState() => _ProfitAndLossReportState();
}

class _ProfitAndLossReportState extends State<ProfitAndLossReport> {
  bool profitAndLossTableExpansion = false;
  bool costOfRevenueTableExpansion = false;
  bool otherIncomeTableExpansion = false;
  bool lessExpenseTableExpansion = false;
  bool lessDepreciationTableExpansion = false;
  bool lessOffBalanceSheetTableExpansion = false;

  ///These lists are used only for testing purpose
  List<String> incomeInnerDataList = [
    '400001-Sales A/c',
    '400002-purchase discount',
    '400003-POS Income',
    '400004-Stiching Income'
  ];
  List<String> incomeInnerDataValuesList = [
    '10188.24',
    '829.6',
    '10338',
    '358136.25'
  ];
  List<String> costOfRevenueInnerDataList = [
    '400001-Sales A/c',
    '500004-Sales Discount',
    '500006-Cost of Goods Sold',
    '500001-Purchase A/c'
  ];
  List<String> costOfRevenueInnerDataValuesList = [
    '354584.25',
    '0.9',
    '2456.12',
    '1357522.32'
  ];
  List<String> otherIncomeInnerDataList = [
    'Rent Received',
    'Interest Received',
  ];
  List<String> otherIncomeInnerDataValuesList = [
    '2456.12',
    '57522.32',
  ];
  List<String> lessExpenseInnerDataList = [
    '500008-Insurance',
    '500004-Traveling Expenses',
    '500006-Rent Expenses',
    '500008-Salary',
    '500004-Advertisement Expenses',
    '500006-Printing & Stationary',
    '500004-Postage',
    '500006-Bad Debt Written Off'
  ];
  List<String> lessExpenseInnerDataValuesList = [
    '354584.25',
    '354584.25',
    '354584.25',
    '354584.25',
    '354584.25',
    '354584.25',
    '354584.25',
    '354584.25'
  ];
  List<String> lessDepreciationInnerDataList = [
    '500004-Computer Depreciation',
    '500006-Furniture Depreciation',
  ];
  List<String> lessDepreciationInnerDataValuesList = [
    '0.9',
    '2456.12',
  ];
  List<String> lessOffBalanceSheetInnerDataList = [
    'Other Expenses @ Off Balance Sheet',
  ];
  List<String> lessOffBalanceSheetInnerDataValuesList = [
    '2456.12',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: AppScreenUtil().screenWidth(16),right: AppScreenUtil().screenWidth(16),bottom: AppScreenUtil().screenHeight(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(5)),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profit & Loss Report',
                  style: profitAndLossTitleLabelStyle,
                )),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
          ProfitAndLossExpansionTableLayout(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              tableColor: Colors.transparent,
              dataList: incomeInnerDataList,
              dataTitle: 'Income',
              opacity: (profitAndLossTableExpansion == true) ? 1.0 : 0,
              tableHeight: (profitAndLossTableExpansion == false)
                  ? AppScreenUtil().screenHeight(23)
                  : AppScreenUtil().screenHeight(125),
              tableOnTap: () {
                setState(() {
                  profitAndLossTableExpansion = !profitAndLossTableExpansion;
                });
              },
              valueList: incomeInnerDataValuesList,
              valueTitle: '379492.09'),

          ProfitAndLossExpansionTableLayout(
              tableColor: Colors.transparent,
              dataList: costOfRevenueInnerDataList,
              dataTitle: 'Less: Cost of Revenue',
              opacity: (costOfRevenueTableExpansion == true) ? 1.0 : 0,
              tableHeight: (costOfRevenueTableExpansion == false)
                  ? AppScreenUtil().screenHeight(23)
                  : AppScreenUtil().screenHeight(125),
              tableOnTap: () {
                setState(() {
                  costOfRevenueTableExpansion = !costOfRevenueTableExpansion;
                });
              },
              valueList: costOfRevenueInnerDataValuesList,
              valueTitle: '1714563.59'),

          ///Gross profit layout
          const SingleRowTableLayout(
            tableColor: blackColor,
            title: 'Gross Profit',
            value: '1335071.50',
            border: Border(bottom: BorderSide(color: whiteColor, width: 0.5)),
          ),

          ProfitAndLossExpansionTableLayout(
              tableColor: Colors.transparent,
              dataList: otherIncomeInnerDataList,
              dataTitle: 'Other income',
              opacity: (otherIncomeTableExpansion == true) ? 1.0 : 0,
              tableHeight: (otherIncomeTableExpansion == false)
                  ? AppScreenUtil().screenHeight(23)
                  : AppScreenUtil().screenHeight(78),
              tableOnTap: () {
                setState(() {
                  otherIncomeTableExpansion = !otherIncomeTableExpansion;
                });
              },
              valueList: otherIncomeInnerDataValuesList,
              valueTitle: '0.00'),

          ProfitAndLossExpansionTableLayout(
              tableColor: Colors.transparent,
              dataList: lessDepreciationInnerDataList,
              dataTitle: 'Less:Depreciation',
              opacity: (lessDepreciationTableExpansion == true) ? 1.0 : 0,
              tableHeight: (lessDepreciationTableExpansion == false)
                  ? AppScreenUtil().screenHeight(23)
                  : AppScreenUtil().screenHeight(79),
              tableOnTap: () {
                setState(() {
                  lessDepreciationTableExpansion =
                      !lessDepreciationTableExpansion;
                });
              },
              valueList: lessDepreciationInnerDataValuesList,
              valueTitle: '0.00'),

          ProfitAndLossExpansionTableLayout(
              tableColor: Colors.transparent,
              dataList: lessOffBalanceSheetInnerDataList,
              dataTitle: 'Less: Off Balance Sheet',
              opacity: (lessOffBalanceSheetTableExpansion == true) ? 1.0 : 0,
              tableHeight: (lessOffBalanceSheetTableExpansion == false)
                  ? AppScreenUtil().screenHeight(23)
                  : AppScreenUtil().screenHeight(52),
              tableOnTap: () {
                setState(() {
                  lessOffBalanceSheetTableExpansion =
                      !lessOffBalanceSheetTableExpansion;
                });
              },
              valueList: lessOffBalanceSheetInnerDataValuesList,
              valueTitle: '0.00'),

          ///Profit and loss account layout
          const SingleRowTableLayout(
            tableColor: blackColor,
            title: 'Profit & Loss Account',
            value: '1335071.50',
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
        ],
      ),
    );
  }
}
