// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/sub_payroll/sub_payroll.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';

class Payroll extends StatefulWidget {
  const Payroll({super.key});

  @override
  State<Payroll> createState() => _PayrollState();
}

class _PayrollState extends State<Payroll> {
  final payroll = <ProductCategoriesModel>[];
  final loan = <ProductCategoriesModel>[];
  final attendance = <ProductCategoriesModel>[];
  final configuration = <ProductCategoriesModel>[];
  final report = <ProductCategoriesModel>[];
  int? tappedPayrolls;
  int? tappedLoan;
  int? tappedAttendance;
  int? tappedConfiguration;
  int? tappedReport;
  String tapped = 'Payroll';
  String tappedLoans = 'Loan';
  String tappedAttendances = 'Attendance';
  String tappedConfigurations = 'Configuration';
  String tappedReports = 'Report';
  dynamic currentTab;
  dynamic item;

  @override
  void initState() {
    payroll.add(ProductCategoriesModel('Payslip',ImageCons.imgPayslip));
    payroll.add(ProductCategoriesModel('Batch PaySlip',ImageCons.imgBatchPayslip));
    payroll.add(ProductCategoriesModel('Salary Disbursement',ImageCons.imgSalaryDisbursement));
    payroll.add(ProductCategoriesModel('Contract',ImageCons.imgContract));
    payroll.add(ProductCategoriesModel('Sponsor', ImageCons.imgSponsor));
    loan.add(ProductCategoriesModel('Loan', ImageCons.imgLoan));
    loan.add(ProductCategoriesModel('Loan Eligibility', ImageCons.imgLoanEligibility));
    attendance.add(ProductCategoriesModel('Attendance', ImageCons.imgAttendence));
    attendance.add(ProductCategoriesModel('Leave', ImageCons.imgLeave));
    attendance.add(ProductCategoriesModel('OverTime', ImageCons.imgOvertime));
    attendance.add(ProductCategoriesModel('EOS', ImageCons.imgEos));
    configuration.add(ProductCategoriesModel('Pay Head', ImageCons.imgPayHead));
    configuration.add(ProductCategoriesModel('Pay Other', ImageCons.imgPayOther));
    configuration.add(ProductCategoriesModel('Pay Template', ImageCons.imgPayTemplate));
    configuration.add(ProductCategoriesModel('Settings', ImageCons.imgTabSettings));
    report.add(ProductCategoriesModel('Report', ImageCons.imgPayrollReport));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Payslip' ||
        currentTab == 'Batch PaySlip' ||
        currentTab == 'Salary Disbursement' ||
        currentTab == 'Contract' ||
        currentTab == 'Sponsor' ||
        currentTab == 'Loan' ||
        currentTab == 'Loan Eligibility'||
        currentTab == 'Attendance' ||
        currentTab == 'Leave' ||
        currentTab == 'OverTime' ||
        currentTab == 'EOS' ||
        currentTab == 'Pay Head'||
        currentTab == 'Pay Other' ||
        currentTab == 'Pay Template' ||
        currentTab == 'Settings' ||
        currentTab == 'Report'
        ? SubPayroll(currentTab, item)
        :Container(
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
        Expanded(child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(0, -2),
                child: Text(
                  'Payroll',
                  style: dashBoardLabelTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(20),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 13,
                children: List<Widget>.generate(payroll.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedPayrolls = index;
                          currentTab = payroll[index].text;
                          item=tapped;
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
                              padding: EdgeInsets.all(9),
                              height: AppScreenUtil().screenHeight(38),
                              width: AppScreenUtil().screenWidth(47),
                              decoration: BoxDecoration(
                                color: tabSelectionAColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(payroll[index].icon),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Center(
                              child: Text(
                                payroll[index].text.toString(),textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                                style: clearDataAlertYesButtonLabelStyle,
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
                child: Text(
                  'Loan',
                  style: categoryTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 13,
                children: List<Widget>.generate(loan.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedLoan = index;
                          currentTab = loan[index].text;
                          item = tappedLoans;
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
                                color: tabSelectionAColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(loan[index].icon),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Text(
                              loan[index].text.toString(),
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
              Center(
                child: Text(
                  'Attendance',
                  style: categoryTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 13,
                children: List<Widget>.generate(attendance.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedAttendance = index;
                          currentTab = attendance[index].text;
                          item = tappedAttendances;
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
                                color: tabSelectionAColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(attendance[index].icon),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Text(
                              attendance[index].text.toString(),
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
              Center(
                child: Text(
                  'Configuration',
                  style: categoryTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 13,
                children: List<Widget>.generate(configuration.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedConfiguration = index;
                          currentTab = configuration[index].text;
                          item = tappedConfigurations;
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
                                color: tabSelectionAColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(configuration[index].icon),
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
                height: AppScreenUtil().screenHeight(20),
              ),
              Center(
                child: Text(
                  'Report',
                  style: categoryTextStyle,
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(15),
              ),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 13,
                children: List<Widget>.generate(report.length, (int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          tappedReport = index;
                          currentTab = configuration[index].text;
                          item = tappedReports;
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
                                color: tabSelectionAColor.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(report[index].icon),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(6),
                            ),
                            Text(
                              report[index].text.toString(),
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
          ),))
      ],
    ));
  }
}
