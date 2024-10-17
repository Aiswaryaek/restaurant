import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/pay_slip_pdf_generation_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class PaySlipLayout extends StatelessWidget {
  const PaySlipLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: constantWhite, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Payslip top section layout
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: blackColor.withOpacity(0.3), width: 0.2))),
            child: Padding(
              padding: EdgeInsets.only(
                  left: AppScreenUtil().screenWidth(16),
                  right: AppScreenUtil().screenWidth(16),
                  top: AppScreenUtil().screenHeight(10),
                  bottom: AppScreenUtil().screenHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payslip',
                    style: paySlipsTitleLabelStyle,
                  ),
                  Row(
                    children: [
                      ///Payslip print button

                      GestureDetector(
                        onTap: () {
                          print('Payslip print button');
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(11.94),
                          width: AppScreenUtil().screenWidth(25.42),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: paySlipPrintButtonColor.withOpacity(0.2)),
                          child: Center(
                            child: SvgPicture.asset(
                              ImageCons.imgPrinter,
                              width: 7.47,
                              height: 7.47,
                              color: paySlipPrintButtonColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppScreenUtil().screenWidth(9.6),
                      ),

                      ///Payslip download button
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: AppScreenUtil().screenHeight(11.94),
                          width: AppScreenUtil().screenWidth(25.42),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color:
                                  paySlipDownloadButtonColor.withOpacity(0.2)),
                          child: Center(
                            child: SvgPicture.asset(
                              ImageCons.imgPaySlipDownloadIcon,
                              width: 7.46,
                              height: 7.46,
                              color: paySlipDownloadButtonColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppScreenUtil().screenHeight(10),
                right: AppScreenUtil().screenWidth(16),
                left: AppScreenUtil().screenWidth(16),
                bottom: AppScreenUtil().screenHeight(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Employement Name
                    Text(
                      'Employee Name : Deepak',
                      style: paySlipsSubTitleLabelStyle,
                    ),

                    ///Employement Id
                    Text(
                      'Employee ID : GSFA45464',
                      style: paySlipsSubTitleLabelStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(11),
                ),

                ///Total leave layout
                Text(
                  'Total Leave : 05',
                  style: paySlipsSubTitleLabelStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(14),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: blackColor.withOpacity(0.1), width: 1),
                          left: BorderSide(
                              color: blackColor.withOpacity(0.1), width: 1),
                          right: BorderSide(
                              color: blackColor.withOpacity(0.1), width: 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Earnings and deduction row
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Earnings',
                                  style: paySlipsTitleLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    color: blackColor.withOpacity(0.1),
                                    width: 1),
                              )),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Deduction',
                                  style: paySlipsTitleLabelStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Payment type and amount layout
                      Row(
                        children: [
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Pay Type',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Amount',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Pay Type',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    color: blackColor.withOpacity(0.1),
                                    width: 1),
                              )),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(5),
                                    bottom: AppScreenUtil().screenHeight(5),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Amount',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      ///Main data layout
                      Row(
                        children: [
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppScreenUtil().screenHeight(8),
                                      left: AppScreenUtil().screenWidth(7)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppScreenUtil()
                                                    .screenHeight(2)),
                                            child: Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(11),
                                              color: Colors.transparent,
                                              child: Text(
                                                'Sample',
                                                style:
                                                    paySlipsTableDataLabelStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppScreenUtil().screenHeight(8),
                                      left: AppScreenUtil().screenWidth(7)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppScreenUtil()
                                                    .screenHeight(2)),
                                            child: Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(11),
                                              color: Colors.transparent,
                                              child: Text(
                                                'Sample',
                                                style:
                                                    paySlipsTableDataLabelStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppScreenUtil().screenHeight(8),
                                      left: AppScreenUtil().screenWidth(7)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppScreenUtil()
                                                    .screenHeight(2)),
                                            child: Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(11),
                                              color: Colors.transparent,
                                              child: Text(
                                                'Sample',
                                                style:
                                                    paySlipsTableDataLabelStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    color: blackColor.withOpacity(0.1),
                                    width: 1),
                              )),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppScreenUtil().screenHeight(8),
                                      left: AppScreenUtil().screenWidth(7)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppScreenUtil()
                                                    .screenHeight(2)),
                                            child: Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(11),
                                              color: Colors.transparent,
                                              child: Text(
                                                'Sample',
                                                style:
                                                    paySlipsTableDataLabelStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),

                      ///Bottom table row
                      Row(
                        children: [
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(6.3),
                                    bottom: AppScreenUtil().screenHeight(7.2),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Total Earnings',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(6.3),
                                    bottom: AppScreenUtil().screenHeight(7.2),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Rs15,000',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 94,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1),
                                      right: BorderSide(
                                          color: blackColor.withOpacity(0.1),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(6.3),
                                    bottom: AppScreenUtil().screenHeight(7.2),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  'Total Deductions',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    color: blackColor.withOpacity(0.1),
                                    width: 1),
                              )),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: AppScreenUtil().screenHeight(6.3),
                                    bottom: AppScreenUtil().screenHeight(7.2),
                                    left: AppScreenUtil().screenWidth(7)),
                                child: Text(
                                  '0.00',
                                  style: paySlipsTableDataLabelStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                ///Net salary layout
                SizedBox(
                  height: AppScreenUtil().screenHeight(4),
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: blackColor.withOpacity(0.1), width: 1)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(7.6),
                        top: AppScreenUtil().screenHeight(6.4),
                        bottom: AppScreenUtil().screenHeight(6.4)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Net Salary',
                              style: netSalaryTitleLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Text(
                              'Inwords',
                              style: netSalarySubTitleLabelStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(35),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rs15,000',
                              style: netSalaryTitleLabelStyle,
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(5),
                            ),
                            Text(
                              'Fifteen Thousand',
                              style: netSalarySubTitleLabelStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                ///Address layout
                SizedBox(
                  height: AppScreenUtil().screenHeight(4),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: blackColor.withOpacity(0.1), width: 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(13)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Company Address',
                          style: companyNameTitleLabelStyle,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(6),
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry\nLorem Ipsum',
                          style: companyNameSubTitleLabelStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
